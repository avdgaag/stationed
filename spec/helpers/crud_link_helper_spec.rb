require 'spec_helper'

RSpec.describe CrudLinkHelper, type: :helper do
  before do
    I18n.backend.store_translations(
      :en,
      helpers: { buttons: { post: {
        new: 'New %{model}',
        show: 'Show %{model} %{id}',
        destroy: 'Destroy %{model} %{id}',
        index: 'List %{plural}',
        edit: 'Edit %{model} %{id}'
      } } },
      activemodel: { models: { post: 'Blog post' } }
    )
    model = Class.new do
      include ActiveModel::Model

      def to_param
        '1'
      end
    end
    stub_const 'Post', model
  end

  it 'generates a link to a new resource' do
    allow(helper).to receive(:new_post_path).and_return('/posts/new')
    expect(helper.link_to_new(Post)).to eql(
      '<a href="/posts/new">New Blog post</a>'
    )
  end

  it 'generates a link to a new nested resource' do
    allow(helper).to receive(:new_admin_post_path).and_return('/admin/posts/new')
    expect(helper.link_to_new([:admin, Post])).to eql(
      '<a href="/admin/posts/new">New Blog post</a>'
    )
  end

  it 'generates a link to show a record' do
    allow(helper).to receive(:posts_path).and_return('/posts/1')
    expect(helper.link_to_show(Post.new)).to eql(
      '<a href="/posts/1">Show Blog post 1</a>'
    )
  end

  it 'generates a link to destroy a record' do
    allow(helper).to receive(:posts_path).and_return('/posts/1')
    expect(helper.link_to_destroy(Post.new)).to eql(
      '<a data-method="delete" href="/posts/1">Destroy Blog post 1</a>'
    )
  end

  it 'generates a link to list all records' do
    allow(helper).to receive(:posts_path).with(no_args).and_return('/posts')
    expect(helper.link_to_index(Post)).to eql(
      '<a href="/posts">List Blog posts</a>'
    )
  end

  it 'generates a link to edit a record' do
    allow(helper).to receive(:edit_posts_path).and_return('/posts/1/edit')
    expect(helper.link_to_edit(Post.new)).to eql(
      '<a href="/posts/1/edit">Edit Blog post 1</a>'
    )
  end

  it 'allows adding custom options' do
    allow(helper).to receive(:new_post_path).and_return('/posts/new')
    expect(helper.link_to_new(Post, title: 'bla')).to eql(
      '<a title="bla" href="/posts/new">New Blog post</a>'
    )
  end

  it 'creates a button' do
    allow(helper).to receive(:new_post_path).and_return('/posts/new')
    expect(helper.button_to_new(Post)).to eql(
      %Q{<form class="button_to" method="post" action="/posts/new"><input type="submit" value="New Blog post" /></form>}
    )
  end

  it 'creates a button link' do
    allow(helper).to receive(:new_post_path).and_return('/posts/new')
    expect(helper.button_link_to_new(Post, title: 'bla')).to eql(
      '<a title="bla" class="button" href="/posts/new">New Blog post</a>'
    )
  end
end
