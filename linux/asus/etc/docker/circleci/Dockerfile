FROM circleci/runner-agent:machine-3
USER circleci
COPY install.sh .
RUN bash install.sh
RUN curl -sSL https://raw.githubusercontent.com/SuCicada/sutools/master/install.rb | ruby &&\
    pip install sumake -U

COPY prepare_job.sh /home/circleci/

WORKDIR /home/circleci
