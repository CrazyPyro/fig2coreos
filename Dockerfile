FROM ruby:latest
RUN gem install fig2coreos
ADD ./fig2coreos-wrapper.sh /
CMD bash -C '/fig2coreos-wrapper.sh';
