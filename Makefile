setup:
	# sudo gem install bundler
	bundle install

serve:
	bundle exec jekyll serve

build:
	rm -rf _site
	bundle exec jekyll build --destination _site --trace
	bundle exec jekyll build --destination _site --trace

lint:
	bundle exec jekyll doctor
	bundle exec htmlproofer ./_site --disable-external

deploy:
	( cd _site; lftp -e 'mirror --reverse --parallel=4 --delete --verbose ; bye' -u $(FTP_USER),$(FTP_PASSWORD) ftp.strato.de )
