Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45913E00712; Fri, 27 Feb 2015 13:41:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDC59E0034A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Feb 2015 13:41:15 -0800 (PST)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1RLfFJ7021660
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Feb 2015 13:41:15 -0800 (PST)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1YRSee-0000bP-PE
	for meta-virtualization@yoctoproject.org;
	Fri, 27 Feb 2015 16:41:04 -0500
Date: Fri, 27 Feb 2015 16:41:04 -0500
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150227214104.GC2255@windriver.com>
References: <20150227214013.GA2160@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20150227214013.GA2160@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 3/5] Package docker-registry
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: amy.fong@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 21:41:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 8af720cf20eb69d0f70908923cb2a81a9a65e5a4 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Fri, 27 Feb 2015 15:59:25 -0500
Subject: [PATCH 3/5] Package docker-registry

Provides repositories of docker images

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 .../docker-registry/docker-registry_git.bb         |  92 +++++++++
 .../files/change_sqlalchemy_rqt.patch              |  13 ++
 .../docker-registry/files/config.yml               | 228 +++++++++++++++++++++
 .../docker-registry/files/docker-registry.conf     |  19 ++
 .../docker-registry/files/docker-registry.service  |  15 ++
 5 files changed, 367 insertions(+)
 create mode 100644 recipes-containers/docker-registry/docker-registry_git.bb
 create mode 100644 recipes-containers/docker-registry/files/change_sqlalchemy_rqt.patch
 create mode 100644 recipes-containers/docker-registry/files/config.yml
 create mode 100644 recipes-containers/docker-registry/files/docker-registry.conf
 create mode 100644 recipes-containers/docker-registry/files/docker-registry.service

diff --git a/recipes-containers/docker-registry/docker-registry_git.bb b/recipes-containers/docker-registry/docker-registry_git.bb
new file mode 100644
index 0000000..8b42d79
--- /dev/null
+++ b/recipes-containers/docker-registry/docker-registry_git.bb
@@ -0,0 +1,92 @@
+HOMEPAGE = "https://github.com/docker/docker-registry"
+SUMMARY = "Registry server for Docker"
+DESCRIPTION = "\
+ This is the classic python docker-registry. \
+ . \
+ hosting/delivering of repositories and images \
+ "
+
+SRCREV = "fd8c0c114985547b69088e0f1526e58bfe2ff914"
+SRC_URI = "\
+	git://github.com/docker/docker-registry.git \
+	file://docker-registry.conf \
+	file://docker-registry.service \
+	file://config.yml \
+	file://change_sqlalchemy_rqt.patch \
+	"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35e8e5305c1b7b4a5761f9de5d44e5f4"
+
+S = "${WORKDIR}/git"
+
+PV = "0.9.1+git${SRCREV}"
+
+RDEPENDS_${PN} += "\
+  docker \
+  gunicorn (= 19.1.1) \
+  python-pip \
+  python-distribute \
+  python-m2crypto (= 0.22.3) \
+  python-pyyaml (= 3.11) \
+  python-flask (= 0.10.1) \
+  python-gevent (= 1.0.1) \
+  python-requests (= 2.3.0) \
+  python-sqlalchemy (>= 0.9.4) \
+  python-blinker (= 1.3) \
+  python-backports-lzma (= 0.0.3) \
+  python-flask-cors (= 1.10.3) \
+  python-bugsnag (= 2.0.2) \
+  python-docker-registry-core (= 2.0.3) \
+  python-newrelic (= 2.22.0.19) \
+  python-itsdangerous (>= 0.21) \
+  python-jinja2 (>= 2.4) \
+  python-werkzeug (>= 0.7) \
+  python-simplejson (= 3.6.2) \
+  python-redis (= 2.10.3) \
+  python-boto (= 2.34.0) \
+  python-webob \
+  "
+# OFFICIAL REQ:
+# docker-registry-core>=2,<3
+# blinker==1.3
+# backports.lzma==0.0.3,!=0.0.4
+
+# Flask==0.10.1
+# gevent==1.0.1
+# gunicorn==19.1.1
+# PyYAML==3.11
+# requests==2.3.0
+# M2Crypto==0.22.3
+# sqlalchemy==0.9.4
+# setuptools==5.8
+# 
+# [bugsnag]
+# bugsnag>=2.0,<2.1
+# 
+# [cors]
+# Flask-cors>=1.8,<2.0
+# 
+# [newrelic]
+# newrelic>=2.22,<2.23
+
+
+inherit setuptools systemd
+
+SYSTEMD_PACKAGES = "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
+SYSTEMD_SERVICE_${PN} = "${@base_contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
+
+do_install_append() {
+	mkdir -p ${D}/etc/default/
+	cp ${WORKDIR}/docker-registry.conf ${D}/etc/default/docker-registry
+
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 644 ${WORKDIR}/docker-registry.service ${D}/${systemd_unitdir}/system
+	fi
+	# based on config_mirror.yml - uses /var/docker-registry instead of /tmp for files
+	install ${WORKDIR}/config.yml ${D}/etc/docker-registry.yml
+	mkdir -p ${D}/var/docker-registry
+}
+
+FILES_${PN} += "/etc/default /var/docker-registry /etc/ /etc/default/volatiles"
diff --git a/recipes-containers/docker-registry/files/change_sqlalchemy_rqt.patch b/recipes-containers/docker-registry/files/change_sqlalchemy_rqt.patch
new file mode 100644
index 0000000..75cbd6d
--- /dev/null
+++ b/recipes-containers/docker-registry/files/change_sqlalchemy_rqt.patch
@@ -0,0 +1,13 @@
+---
+ requirements/main.txt |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/requirements/main.txt
++++ b/requirements/main.txt
+@@ -5,5 +5,5 @@
+ PyYAML==3.11
+ requests==2.3.0
+ M2Crypto==0.22.3
+-sqlalchemy==0.9.4
++sqlalchemy>=0.9.4
+ setuptools==5.8
diff --git a/recipes-containers/docker-registry/files/config.yml b/recipes-containers/docker-registry/files/config.yml
new file mode 100644
index 0000000..8b33766
--- /dev/null
+++ b/recipes-containers/docker-registry/files/config.yml
@@ -0,0 +1,228 @@
+# All other flavors inherit the `common' config snippet
+common: &common
+    issue: '"docker-registry server"'
+    # Default log level is info
+    loglevel: _env:LOGLEVEL:info
+    # Enable debugging (additional informations in the output of the _ping endpoint)
+    debug: _env:DEBUG:false
+    # By default, the registry acts standalone (eg: doesn't query the index)
+    standalone: _env:STANDALONE:true
+    # The default endpoint to use (if NOT standalone) is index.docker.io
+    index_endpoint: _env:INDEX_ENDPOINT:https://index.docker.io
+    # Storage redirect is disabled
+    storage_redirect: _env:STORAGE_REDIRECT
+    # Token auth is enabled (if NOT standalone)
+    disable_token_auth: _env:DISABLE_TOKEN_AUTH
+    # No priv key
+    privileged_key: _env:PRIVILEGED_KEY
+    # No search backend
+    search_backend: _env:SEARCH_BACKEND
+    # SQLite search backend
+    sqlalchemy_index_database: _env:SQLALCHEMY_INDEX_DATABASE:sqlite:////var/docker-registry/docker-registry.db
+
+    # Mirroring is not enabled
+    mirroring:
+        source: _env:MIRROR_SOURCE # https://registry-1.docker.io
+        source_index: _env:MIRROR_SOURCE_INDEX # https://index.docker.io
+        tags_cache_ttl: _env:MIRROR_TAGS_CACHE_TTL:172800 # seconds
+
+    cache:
+        host: _env:CACHE_REDIS_HOST
+        port: _env:CACHE_REDIS_PORT
+        db: _env:CACHE_REDIS_DB:0
+        password: _env:CACHE_REDIS_PASSWORD
+
+    # Enabling LRU cache for small files
+    # This speeds up read/write on small files
+    # when using a remote storage backend (like S3).
+    cache_lru:
+        host: _env:CACHE_LRU_REDIS_HOST
+        port: _env:CACHE_LRU_REDIS_PORT
+        db: _env:CACHE_LRU_REDIS_DB:0
+        password: _env:CACHE_LRU_REDIS_PASSWORD
+
+    # Enabling these options makes the Registry send an email on each code Exception
+    email_exceptions:
+        smtp_host: _env:SMTP_HOST
+        smtp_port: _env:SMTP_PORT:25
+        smtp_login: _env:SMTP_LOGIN
+        smtp_password: _env:SMTP_PASSWORD
+        smtp_secure: _env:SMTP_SECURE:false
+        from_addr: _env:SMTP_FROM_ADDR:docker-registry@localdomain.local
+        to_addr: _env:SMTP_TO_ADDR:noise+dockerregistry@localdomain.local
+
+    # Enable bugsnag (set the API key)
+    bugsnag: _env:BUGSNAG
+
+    # CORS support is not enabled by default
+    cors:
+        origins: _env:CORS_ORIGINS
+        methods: _env:CORS_METHODS
+        headers: _env:CORS_HEADERS:[Content-Type]
+        expose_headers: _env:CORS_EXPOSE_HEADERS
+        supports_credentials: _env:CORS_SUPPORTS_CREDENTIALS
+        max_age: _env:CORS_MAX_AGE
+        send_wildcard: _env:CORS_SEND_WILDCARD
+        always_send: _env:CORS_ALWAYS_SEND
+        automatic_options: _env:CORS_AUTOMATIC_OPTIONS
+        vary_header: _env:CORS_VARY_HEADER
+        resources: _env:CORS_RESOURCES
+
+local: &local
+    <<: *common
+    storage: local
+    storage_path: _env:STORAGE_PATH:/var/docker-registry
+
+
+s3: &s3
+    <<: *common
+    storage: s3
+    s3_region: _env:AWS_REGION
+    s3_bucket: _env:AWS_BUCKET
+    boto_bucket: _env:AWS_BUCKET
+    storage_path: _env:STORAGE_PATH:/registry
+    s3_encrypt: _env:AWS_ENCRYPT:true
+    s3_secure: _env:AWS_SECURE:true
+    s3_access_key: _env:AWS_KEY
+    s3_secret_key: _env:AWS_SECRET
+    s3_use_sigv4: _env:AWS_USE_SIGV4
+    boto_host: _env:AWS_HOST
+    boto_port: _env:AWS_PORT
+    boto_calling_format: _env:AWS_CALLING_FORMAT
+
+cloudfronts3: &cloudfronts3
+    <<: *s3
+    cloudfront:
+        base: _env:CF_BASE_URL
+        keyid: _env:CF_KEYID
+        keysecret: _env:CF_KEYSECRET
+
+azureblob: &azureblob
+    <<: *common
+    storage: azureblob
+    azure_storage_account_name: _env:AZURE_STORAGE_ACCOUNT_NAME
+    azure_storage_account_key: _env:AZURE_STORAGE_ACCOUNT_KEY
+    azure_storage_container: _env:AZURE_STORAGE_CONTAINER:registry
+    azure_use_https: _env:AZURE_USE_HTTPS:true
+
+# Ceph Object Gateway Configuration
+# See http://ceph.com/docs/master/radosgw/ for details on installing this service.
+ceph-s3: &ceph-s3
+    <<: *common
+    storage: s3
+    s3_region: ~
+    s3_bucket: _env:AWS_BUCKET
+    s3_encrypt: _env:AWS_ENCRYPT:false
+    s3_secure: _env:AWS_SECURE:false
+    storage_path: _env:STORAGE_PATH:/registry
+    s3_access_key: _env:AWS_KEY
+    s3_secret_key: _env:AWS_SECRET
+    boto_bucket: _env:AWS_BUCKET
+    boto_host: _env:AWS_HOST
+    boto_port: _env:AWS_PORT
+    boto_debug: _env:AWS_DEBUG:0
+    boto_calling_format: _env:AWS_CALLING_FORMAT
+
+# Google Cloud Storage Configuration
+# See:
+# https://developers.google.com/storage/docs/reference/v1/getting-startedv1#keys
+# for details on access and secret keys.
+gcs:
+    <<: *common
+    storage: gcs
+    boto_bucket: _env:GCS_BUCKET
+    storage_path: _env:STORAGE_PATH:/registry
+    gs_secure: _env:GCS_SECURE:true
+    gs_access_key: _env:GCS_KEY
+    gs_secret_key: _env:GCS_SECRET
+    # OAuth 2.0 authentication with the storage.
+    # oauth2 can be set to true or false. If it is set to true, gs_access_key,
+    # gs_secret_key and gs_secure are not needed.
+    # Client ID and Client Secret must be set into OAUTH2_CLIENT_ID and
+    # OAUTH2_CLIENT_SECRET environment variables.
+    # See: https://developers.google.com/accounts/docs/OAuth2.
+    oauth2: _env:GCS_OAUTH2:false
+
+# This flavor is for storing images in Openstack Swift
+swift: &swift
+    <<: *common
+    storage: swift
+    storage_path: _env:STORAGE_PATH:/registry
+    # keystone authorization
+    swift_authurl: _env:OS_AUTH_URL
+    swift_container: _env:OS_CONTAINER
+    swift_user: _env:OS_USERNAME
+    swift_password: _env:OS_PASSWORD
+    swift_tenant_name: _env:OS_TENANT_NAME
+    swift_region_name: _env:OS_REGION_NAME
+
+# This flavor stores the images in Glance (to integrate with openstack)
+# See also: https://github.com/docker/openstack-docker
+glance: &glance
+    <<: *common
+    storage: glance
+    storage_alternate: _env:GLANCE_STORAGE_ALTERNATE:file
+    storage_path: _env:STORAGE_PATH:/var/docker-registry
+
+openstack:
+    <<: *glance
+
+# This flavor stores the images in Glance (to integrate with openstack)
+# and tags in Swift.
+glance-swift: &glance-swift
+    <<: *swift
+    storage: glance
+    storage_alternate: swift
+
+openstack-swift:
+    <<: *glance-swift
+
+elliptics:
+    <<: *common
+    storage: elliptics
+    elliptics_nodes: _env:ELLIPTICS_NODES
+    elliptics_wait_timeout: _env:ELLIPTICS_WAIT_TIMEOUT:60
+    elliptics_check_timeout: _env:ELLIPTICS_CHECK_TIMEOUT:60
+    elliptics_io_thread_num: _env:ELLIPTICS_IO_THREAD_NUM:2
+    elliptics_net_thread_num: _env:ELLIPTICS_NET_THREAD_NUM:2
+    elliptics_nonblocking_io_thread_num: _env:ELLIPTICS_NONBLOCKING_IO_THREAD_NUM:2
+    elliptics_groups: _env:ELLIPTICS_GROUPS
+    elliptics_verbosity: _env:ELLIPTICS_VERBOSITY:4
+    elliptics_logfile: _env:ELLIPTICS_LOGFILE:/dev/stderr
+    elliptics_addr_family: _env:ELLIPTICS_ADDR_FAMILY:2
+
+# This flavor stores the images in Aliyun OSS
+# See:
+# https://i.aliyun.com/access_key/
+# for details on access and secret keys.
+oss: &oss
+    <<: *common
+    storage: oss
+    storage_path: _env:STORAGE_PATH:/registry/
+    oss_host: _env:OSS_HOST
+    oss_bucket: _env:OSS_BUCKET
+    oss_accessid: _env:OSS_KEY
+    oss_accesskey: _env:OSS_SECRET
+
+
+
+# This is the default configuration when no flavor is specified
+dev: &dev
+    <<: *local
+    loglevel: _env:LOGLEVEL:debug
+    debug: _env:DEBUG:true
+    search_backend: _env:SEARCH_BACKEND:sqlalchemy
+
+# This flavor is used by unit tests
+test:
+    <<: *dev
+    index_endpoint: https://registry-stage.hub.docker.com
+    standalone: true
+    storage_path: _env:STORAGE_PATH:./tmp/test
+
+# To specify another flavor, set the environment variable SETTINGS_FLAVOR
+# $ export SETTINGS_FLAVOR=prod
+prod:
+    <<: *s3
+    storage_path: _env:STORAGE_PATH:/prod
+
diff --git a/recipes-containers/docker-registry/files/docker-registry.conf b/recipes-containers/docker-registry/files/docker-registry.conf
new file mode 100644
index 0000000..940ece1
--- /dev/null
+++ b/recipes-containers/docker-registry/files/docker-registry.conf
@@ -0,0 +1,19 @@
+# The Docker registry configuration file
+DOCKER_REGISTRY_CONFIG=/etc/docker-registry.yml
+
+# The configuration to use from DOCKER_REGISTRY_CONFIG file
+SETTINGS_FLAVOR=local
+
+# Address to bind the registry to
+REGISTRY_ADDRESS=0.0.0.0
+
+# Port to bind the registry to
+REGISTRY_PORT=5000
+
+# Number of workers to handle the connections
+GUNICORN_WORKERS=4
+
+STANDALONE=true
+
+MIRROR_SOURCE=https://registry-1.docker.io
+MIRROR_SOURCE_INDEX=https://index.docker.io
diff --git a/recipes-containers/docker-registry/files/docker-registry.service b/recipes-containers/docker-registry/files/docker-registry.service
new file mode 100644
index 0000000..4f4cfe7
--- /dev/null
+++ b/recipes-containers/docker-registry/files/docker-registry.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Registry server for Docker
+After=docker.service
+Requires=docker.service
+
+[Service]
+Type=simple
+Environment=DOCKER_REGISTRY_CONFIG=/etc/docker-registry.yml
+EnvironmentFile=-/etc/default/docker-registry
+WorkingDirectory=#WORKDIR#
+ExecStart=/usr/bin/gunicorn --access-logfile /var/log/docker-registry-access.log --error-logfile /var/log/docker-registry-error.log --debug --max-requests 100 --graceful-timeout 3600 -t 3600 -k gevent -b ${REGISTRY_ADDRESS}:${REGISTRY_PORT} -w ${GUNICORN_WORKERS} docker_registry.wsgi:application
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
-- 
2.1.4


