docker:
	docker run -it --rm --entrypoint sh -v $(PWD):/app -p 4000:4000 ruby:2-alpine

setup:
	apk --no-cache add build-base lftp
	# sudo gem install bundler
	bundle install

update:
	bundle update

serve:
	bundle exec jekyll serve -H 127.0.0.1

build:
	rm -rf _site
	bundle exec jekyll build --destination _site --trace
	bundle exec jekyll build --destination _site --trace

lint:
	bundle exec jekyll doctor
	bundle exec htmlproofer ./_site --disable-external=true --enforce-https=false

deploy:
	( cd _site; lftp -e 'mirror --reverse --parallel=4 --delete --verbose ; bye' -u $(FTP_USER),$(FTP_PASSWORD) ftp.strato.de )
