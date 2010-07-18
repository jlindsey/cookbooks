package 'tmux'

cookbook_file '~/.tmux.conf' do
  source 'tmux.conf'
  mode 0644
end
