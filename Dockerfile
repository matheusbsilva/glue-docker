FROM amazon/aws-glue-libs:glue_libs_3.0.0_image_01

ARG USER_ID=1000
ARG DRIVER_MEMORY=4g
ARG EXECUTOR_MEMORY=4g

USER root
RUN usermod -u $USER_ID glue_user
RUN chown -R glue_user /home/glue_user && find / -user 10000 -not -path "/proc/*" -exec chown -h glue_user {} \;
RUN echo -e "\nspark.driver.memory $DRIVER_MEMORY" >> $SPARK_HOME/conf/spark-defaults.conf
RUN echo -e "\nspark.executor.memory $EXECUTOR_MEMORY" >> $SPARK_HOME/conf/spark-defaults.conf

USER glue_user
