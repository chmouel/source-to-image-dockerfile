FROM centos:7

# Install Maven, Jenkins and add the base-plugin.txt from openshift/jenkins
# images and the install-plugins script, run the install-scripts to install the plugins
RUN mkdir -p /usr/local/bin && \
    curl -L $(curl -L -s "https://api.github.com/repos/openshift/source-to-image/releases/latest"| python -c "import sys, json;x=json.load(sys.stdin);print([ r['browser_download_url'] for r in x['assets'] if 'linux-amd64' in r['name']][0])") -o /tmp/s2i.tgz && \
    tar xz -f/tmp/s2i.tgz -C /usr/local/bin/

CMD /usr/local/bin/s2i
