Return-Path: <raitosyo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF506C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 03:06:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.40624.1752721554515439390
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 20:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MxkH7CN3;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raitosyo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73c17c770a7so682805b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 20:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752721554; x=1753326354; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3aPQyvKztoYXjRdCZxewL7/CPT5AiUoh8gzDNn4bVBA=;
        b=MxkH7CN3ZxAIaiuWK5hQzDzNkbKJKiD5vi6p2ohCqfUuxpeK+QduLH2uq17HrPwNk+
         X6D7qNqjDNK8YPE+euK3V6c51B6x22YcOznOUo91Zgua6+NBHbFycYXquzzwUy0dupDp
         x4tBPMCqThqeYknTVzAaiWmsPoJyzgL0i+aeauN+GOymyguzwuvJSViNak33OqgxT6qX
         iYH21+Gvli+Y7wOV6vNx2LG0ke6jsun+ekNfSMADyF7JmIvL1/AHQgRzN+mOf3eeQL41
         tSzQgisJeAdy5nDKoNO+UPyZbkC9faZFcOndGBp7l1I0t/67UiTjbkiZG5BB1KoJz/rp
         +blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721554; x=1753326354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aPQyvKztoYXjRdCZxewL7/CPT5AiUoh8gzDNn4bVBA=;
        b=wKE8Oe6HhCcPxb7wlxaP6V4g08icQepDRicreI80HgvbboW1aqKK+NRaEd4CuoHp0g
         BtKoFchjIAnw917dNTBj3t4kqxIyDCPwsIJ3sQgQea6LFljfaEMJTZpQcZFE+aXhbZL6
         rBbkmejCtfHQXGkfkRDplg0URrAd8fVjsHeatNR1Q7JQYUTu5u1w5DDv98fsYW617ITm
         CPd6EzcIULPOD+gviWMOAabWJlkxT8An0IxqevqLh0xFe8jeq0LyMnOQNGXd3fJMYVmW
         MSjjbwOKql4YgY0JWm2MC9yauvgNoqm9m0j8BL4N9ppTnjtc7GFyHbuW2f3ZLLxr5tMx
         C3YA==
X-Gm-Message-State: AOJu0YzW0ocmHXGVosen/AdbJ/OCFIFI4YWACCWbhs27FiKDzec6tcFA
	Wkz7JXCc6czjySDnOXPX5BMqLs0IZOXJaqUFUqSyBiIWn1QwgrRX+D8s5Lz94A==
X-Gm-Gg: ASbGncvHSMm6dqNToEJic2AgoPJgc28o25r3ITpx2m/qXKewkB3n+9hnb2G5Fh7dQnk
	WDP14vil7mGnPNRuJ20DwMpPSTXmGPDjkYuLZ2sy+iEKDcDYwZNJ6evBUXrUxD/8hBBBGwhLdYu
	/OMLbOFIOt3Nn0a4ewhdZDIkNT9Dg1TobEPRhfCIXYppT9TyVBvkEynoN1IHLkN5e51+3MWW0Y2
	ZpTcHLVT8F3Q9F0oESqMuPcYi5bpCesNKkrLVwmUZxLjXpIxNQETHeDww7kCKm9oZkanUPMaxLt
	1S/QXhymiDQtjKF1IduspI0kVaNp/Yix+EsRF7atZ6fZ2UD1zyPLGZQYaRSGzBbmJJIVqDet8Kc
	posPT2Uyiy2YgXro=
X-Google-Smtp-Source: AGHT+IFRJjpUicq7h1oGfmoXZir0vUi7BqHiOVs2vfiu5Av9sADmFLiO7To3BrEogW23Z/I1026pjg==
X-Received: by 2002:a05:6a00:846:b0:736:a8db:93b4 with SMTP id d2e1a72fcca58-75723161895mr6679431b3a.2.1752721553322;
        Wed, 16 Jul 2025 20:05:53 -0700 (PDT)
Received: from fedora ([240d:1a:3a7:a400:9a57:aa11:487a:b54f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b5aesm15476310b3a.92.2025.07.16.20.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 20:05:52 -0700 (PDT)
From: Ryosuke Saito <raitosyo@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: ryosuke.saito@linaro.org
Subject: [meta-virtualization][m-c-s][PATCH v2] meta-openstack: Fix whitespace warnings
Date: Thu, 17 Jul 2025 12:05:41 +0900
Message-ID: <20250717030541.730275-1-raitosyo@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Jul 2025 03:06:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9317

From: Ryosuke Saito <ryosuke.saito@linaro.org>

Add whitespaces around variable assignments to eliminate the build warnings:

WARNING: python-ceilometer_git.bb:25 has a lack of whitespace around the assignment:
 'KEYSTONE_HOST="${CONTROLLER_IP}"'
WARNING: python-cinder_git.bb:39 has a lack of whitespace around the assignment:
 'KEYSTONE_HOST="${CONTROLLER_IP}"'
...

Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
---
V1 -> V2: Rebased on to current master 24f0b028ecdd ("layer/global: update S assignments")

 meta-openstack/classes/monitor.bbclass             | 12 ++++++------
 .../recipes-devtools/python/python-barbican_git.bb |  2 +-
 .../python/python-ceilometer_git.bb                |  2 +-
 .../recipes-devtools/python/python-cinder_git.bb   |  2 +-
 .../python/python-cinderclient_git.bb              |  4 ++--
 .../recipes-devtools/python/python-glance_git.bb   |  2 +-
 .../recipes-devtools/python/python-heat_git.bb     |  2 +-
 .../python/python-heatclient_git.bb                |  2 +-
 .../python/python-keystone-hybrid-backend_git.bb   |  4 ++--
 .../recipes-devtools/python/python-keystone_git.bb |  2 +-
 .../python/python-neutron-lib_git.bb               |  4 ++--
 .../recipes-devtools/python/python-neutron_git.bb  |  2 +-
 .../recipes-devtools/python/python-nova_git.bb     |  2 +-
 .../recipes-devtools/python/python-rally_git.bb    |  4 ++--
 .../recipes-devtools/python/python-swift_git.bb    |  6 +++---
 .../recipes-devtools/python/python-trove_git.bb    |  6 +++---
 .../python/python3-glance-store_git.bb             |  4 ++--
 .../python/python3-magnumclient_3.3.0.bb           |  2 +-
 .../python/python3-manilaclient_2.4.0.bb           |  2 +-
 .../python/python3-mistralclient_4.1.1.bb          |  2 +-
 .../python/python3-taskflow_git.bb                 |  4 ++--
 .../python/python3-zaqarclient_2.0.0.bb            |  2 +-
 .../recipes-extended/guest-images/cirros_0.3.2.bb  |  4 ++--
 meta-openstack/recipes-extended/qpid/qpid_0.20.bb  |  2 +-
 .../recipes-extended/tempest/tempest_git.bb        |  6 +++---
 meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb |  4 ++--
 meta-openstack/recipes-support/salt/salt_3001.1.bb | 14 +++++++-------
 27 files changed, 52 insertions(+), 52 deletions(-)
 mode change 100755 => 100644 meta-openstack/recipes-devtools/python/python-trove_git.bb

diff --git a/meta-openstack/classes/monitor.bbclass b/meta-openstack/classes/monitor.bbclass
index e21778003618..7810b9b93c31 100644
--- a/meta-openstack/classes/monitor.bbclass
+++ b/meta-openstack/classes/monitor.bbclass
@@ -1,9 +1,9 @@
-MONITOR_STAGING_DIR="${STAGING_DIR}/monitor"
-MONITOR_STAGING_SERVICES_DIR="${MONITOR_STAGING_DIR}/services"
-MONITOR_STAGING_CHECKS_DIR="${MONITOR_STAGING_DIR}/checks"
-MONITOR_CONFIG_DIR="${IMAGE_ROOTFS}/etc/monitor"
-MONITOR_CONFIG_SERVICES_DIR="${MONITOR_CONFIG_DIR}/services"
-MONITOR_CONFIG_CHECKS_DIR="${MONITOR_CONFIG_DIR}/checks"
+MONITOR_STAGING_DIR = "${STAGING_DIR}/monitor"
+MONITOR_STAGING_SERVICES_DIR = "${MONITOR_STAGING_DIR}/services"
+MONITOR_STAGING_CHECKS_DIR = "${MONITOR_STAGING_DIR}/checks"
+MONITOR_CONFIG_DIR = "${IMAGE_ROOTFS}/etc/monitor"
+MONITOR_CONFIG_SERVICES_DIR = "${MONITOR_CONFIG_DIR}/services"
+MONITOR_CONFIG_CHECKS_DIR = "${MONITOR_CONFIG_DIR}/checks"
 
 addtask monitor_install before do_package after do_install
 addtask monitor_clean before do_clean
diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
index 90ed8d778dfd..ffc7a63c5df7 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
@@ -21,7 +21,7 @@ PV = "2015.1.0+git${SRCPV}"
 inherit update-rc.d setuptools3 identity hosts useradd default_configs monitor
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
index 1592cd200436..9eec72cd2cd9 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
@@ -20,7 +20,7 @@ PV = "5.0.0+git${SRCPV}"
 CEILOMETER_SECRET ?= "12121212"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-reseller"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index 5f5602474b1e..f72036dbf22c 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -35,7 +35,7 @@ USERADD_PARAM:${PN} = "--system -m -d ${localstatedir}/lib/cinder -s /bin/false
 
 CINDER_BACKUP_BACKEND_DRIVER ?= "cinder.backup.drivers.swift"
 
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 CINDER_LVM_VOLUME_BACKING_FILE_SIZE ?= "2G"
 CINDER_NFS_VOLUME_SERVERS_DEFAULT = "controller:/etc/cinder/nfs_volumes"
diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
index 2f6267747d19..02000306d7d2 100644
--- a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
@@ -12,8 +12,8 @@ SRC_URI = "\
 	file://cinder-api-check.sh \
 	"
 
-PV="3.1.0+git${SRCPV}"
-SRCREV="3640aeab6e11987288a2f149fbeedb1c026045e2"
+PV = "3.1.0+git${SRCPV}"
+SRCREV = "3640aeab6e11987288a2f149fbeedb1c026045e2"
 
 inherit setuptools3 monitor
 
diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index 06e4d9352133..5e7bd88ac86f 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -34,7 +34,7 @@ GLANCE_KNOWN_STORES ?= "glance.store.rbd.Store,\
  glance.store.http.Store"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index c46fc7a3f429..cb833fbfd849 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -19,7 +19,7 @@ SRCREV = "4348b7ababd1048e17ec354ca38c903c908cd74e"
 PV = "5.0.0+git${SRCPV}"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-templates ${SRCNAME}-cfn"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
index b1f7b4ffaba3..40ac44b8cc40 100644
--- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
@@ -14,7 +14,7 @@ DEPENDS += " \
         python-pbr-native \
         "
 
-RDEPENDS:${PN} +="python-cliff \
+RDEPENDS:${PN} += "python-cliff \
 	python-httplib2 \
 	python-iso8601 \
 	python-prettytable \
diff --git a/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb b/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb
index 375969bc4638..4b7c18898e4a 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb
@@ -8,8 +8,8 @@ PR = "r0"
 
 SRC_URI = "git://github.com/SUSE-Cloud/keystone-hybrid-backend.git;branch=havana;protocol=https"
 
-PV="git${SRCPV}"
-SRCREV="0bd376242f8522edef7031d2339b9533b86c17aa"
+PV = "git${SRCPV}"
+SRCREV = "0bd376242f8522edef7031d2339b9533b86c17aa"
 
 inherit python3-dir
 
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index 5ec5af2c8aa8..7fae4c7121bb 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -35,7 +35,7 @@ USERADD_PARAM:${PN} = "--system -m -s /bin/false keystone"
 LDAP_DN ?= "dc=my-domain,dc=com"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be
 # set.  If the flag for a parameter in the list is not set here, the default
diff --git a/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb b/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb
index 84e766dc3724..adefdd9be332 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://git.openstack.org/openstack/neutron-lib.git;branch=stable/pike \
 	"
 
-PV="1.9.1+git${SRCPV}"
-SRCREV="f0d7e470c2ef1702b2715ceb2fd8a00fce2a23be"
+PV = "1.9.1+git${SRCPV}"
+SRCREV = "f0d7e470c2ef1702b2715ceb2fd8a00fce2a23be"
 
 inherit setuptools3
 
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index 7229e47fd160..7ed21af9702b 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -40,7 +40,7 @@ GROUPADD_PARAM:${PN} = "--system ${GROUP}"
 USERADD_PARAM:${PN} = "--system -m -d ${localstatedir}/lib/neutron -s /bin/false -g ${GROUP} ${USER}"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index fc96b514d645..247e81669db5 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -51,7 +51,7 @@ USERADD_PARAM:${PN} = "--system -m -d ${localstatedir}/lib/nova -s /bin/false -g
 PLACEMENT_USER = "placement"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-ec2"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-rally_git.bb b/meta-openstack/recipes-devtools/python/python-rally_git.bb
index 11bd331fcbab..015c34a918cc 100644
--- a/meta-openstack/recipes-devtools/python/python-rally_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-rally_git.bb
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/stackforge/${SRCNAME}.git;branch=master;protocol=htt
            file://verification-subunit2json-fail-to-open-result-file.patch \
 "
 
-SRCREV="b297cf00750f263b8b5bdeb71f6952f672e87f5a"
-PV="git${SRCPV}"
+SRCREV = "b297cf00750f263b8b5bdeb71f6952f672e87f5a"
+PV = "git${SRCPV}"
 
 inherit setuptools3 update-rc.d hosts identity default_configs
 
diff --git a/meta-openstack/recipes-devtools/python/python-swift_git.bb b/meta-openstack/recipes-devtools/python/python-swift_git.bb
index e734d24b3254..08836d2d0a2e 100644
--- a/meta-openstack/recipes-devtools/python/python-swift_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-swift_git.bb
@@ -16,8 +16,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master;protocol=http
            file://cluster.conf \
 "
 
-SRCREV="4ca08cc395e686265574366497a6869e94eebcb2"
-PV="2.2.2+git${SRCPV}"
+SRCREV = "4ca08cc395e686265574366497a6869e94eebcb2"
+PV = "2.2.2+git${SRCPV}"
 
 inherit setuptools3 python3-dir update-rc.d hosts identity
 
@@ -29,7 +29,7 @@ inherit setuptools3 python3-dir update-rc.d hosts identity
 SWIFT_BACKING_FILE_SIZE ?= "2G"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-trove_git.bb b/meta-openstack/recipes-devtools/python/python-trove_git.bb
old mode 100755
new mode 100644
index a0dfaa4faf4d..16d8f220de2a
--- a/meta-openstack/recipes-devtools/python/python-trove_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-trove_git.bb
@@ -10,13 +10,13 @@ SRC_URI = "git://github.com/openstack/trove.git;branch=master;protocol=https \
           file://trove-init \
           "
 
-SRCREV="11996635299396f181f5aec3c6825f8011d45e2c"
-PV="4.0.0+git${SRCPV}"
+SRCREV = "11996635299396f181f5aec3c6825f8011d45e2c"
+PV = "4.0.0+git${SRCPV}"
 
 inherit update-rc.d setuptools3 identity hosts useradd default_configs
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be
 # set.  If the flag for a parameter in the list is not set here, the default
diff --git a/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb b/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
index 9c923f642098..3ecd5ebb741b 100644
--- a/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://git.openstack.org/openstack/glance_store.git;branch=stable/pike \
 	"
 
-PV="0.22.0+git${SRCPV}"
-SRCREV="49c915f498fc8d91c98fcf4e07ceecdcf167fc5a"
+PV = "0.22.0+git${SRCPV}"
+SRCREV = "49c915f498fc8d91c98fcf4e07ceecdcf167fc5a"
 
 inherit setuptools3
 
diff --git a/meta-openstack/recipes-devtools/python/python3-magnumclient_3.3.0.bb b/meta-openstack/recipes-devtools/python/python3-magnumclient_3.3.0.bb
index 68676000a63b..fa23937e6be7 100644
--- a/meta-openstack/recipes-devtools/python/python3-magnumclient_3.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-magnumclient_3.3.0.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
         python3-pbr-native \
         "
 
-RDEPENDS:${PN} +=" \
+RDEPENDS:${PN} += " \
         python3-pbr \
         python3-babel \
         python3-oslo.config \
diff --git a/meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb b/meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
index 7e51ec664fbd..809260751c97 100644
--- a/meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-manilaclient_2.4.0.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
         python3-pbr-native \
         "
 
-RDEPENDS:${PN} +=" \
+RDEPENDS:${PN} += " \
         python3-pbr \
         python3-iso8601 \
         python3-oslo.config \
diff --git a/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb b/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb
index 7f7975486258..98027dca1384 100644
--- a/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python3-mistralclient_4.1.1.bb
@@ -18,7 +18,7 @@ DEPENDS += " \
         python3-pbr-native \
         "
 
-RDEPENDS:${PN} +=" \
+RDEPENDS:${PN} += " \
         python3-cliff \
         python3-pbr \
         python3-keystoneclient \
diff --git a/meta-openstack/recipes-devtools/python/python3-taskflow_git.bb b/meta-openstack/recipes-devtools/python/python3-taskflow_git.bb
index 7425580599d2..44a1660e289b 100644
--- a/meta-openstack/recipes-devtools/python/python3-taskflow_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-taskflow_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://git.openstack.org/openstack/taskflow.git;branch=stable/pike \
 	"
 
-PV="2.14.1+git${SRCPV}"
-SRCREV="ed867c4fd17e4102a133c313a13af37baccf14a4"
+PV = "2.14.1+git${SRCPV}"
+SRCREV = "ed867c4fd17e4102a133c313a13af37baccf14a4"
 
 inherit setuptools3
 
diff --git a/meta-openstack/recipes-devtools/python/python3-zaqarclient_2.0.0.bb b/meta-openstack/recipes-devtools/python/python3-zaqarclient_2.0.0.bb
index 55423b75238f..28d37f14717c 100644
--- a/meta-openstack/recipes-devtools/python/python3-zaqarclient_2.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-zaqarclient_2.0.0.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
         python3-pbr-native \
         "
 
-RDEPENDS:${PN} +=" \
+RDEPENDS:${PN} += " \
         python3-pbr \
         python3-requests \
         python3-six \
diff --git a/meta-openstack/recipes-extended/guest-images/cirros_0.3.2.bb b/meta-openstack/recipes-extended/guest-images/cirros_0.3.2.bb
index 23e326bb9f8c..16b4a70f9856 100644
--- a/meta-openstack/recipes-extended/guest-images/cirros_0.3.2.bb
+++ b/meta-openstack/recipes-extended/guest-images/cirros_0.3.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "An image containing the cirros cloud guest"
 DESCRIPTION = "CirrOS a tiny cloud guest"
 HOMEPAGE = "https://launchpad.net/cirros"
 
-LICENSE="GPL-2.0-only"
+LICENSE = "GPL-2.0-only"
 
 SRC_URI = "http://download.cirros-cloud.net/${PV}/${PN}-${PV}-x86_64-disk.img"
 
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "a2ca56aeded5a5bcaa6104fb14ec07b1ceb65222e2890bef8a89b8d2da
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-INHIBIT_PACKAGE_STRIP="1"
+INHIBIT_PACKAGE_STRIP = "1"
 
 do_install() {
 	     install -d ${D}/${ROOT_HOME}/images
diff --git a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
index b879dcc6ca30..f83eb65ec010 100644
--- a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
+++ b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
@@ -24,7 +24,7 @@ export PERLCONFIGTARGET = "${@is_target(d)}"
 export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
 export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
 export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
-export PERL="${STAGING_BINDIR}/perl"
+export PERL = "${STAGING_BINDIR}/perl"
 
 EXTRA_OECONF += " --without-help2man SASL_PASSWD=/usr/sbin/saslpasswd2"
 EXTRA_OEMAKE += " CPPFLAGS=-Wno-unused-function \
diff --git a/meta-openstack/recipes-extended/tempest/tempest_git.bb b/meta-openstack/recipes-extended/tempest/tempest_git.bb
index 545d71f5362f..881b0917989a 100644
--- a/meta-openstack/recipes-extended/tempest/tempest_git.bb
+++ b/meta-openstack/recipes-extended/tempest/tempest_git.bb
@@ -14,11 +14,11 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master;protocol=http
            file://logging.conf \
 "
 
-SRCREV="2707a0f065e52d8331d12c983ead95de1224cb32"
-PV="2014.1+git${SRCPV}"
+SRCREV = "2707a0f065e52d8331d12c983ead95de1224cb32"
+PV = "2014.1+git${SRCPV}"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-setup-altdemo ${SRCNAME}-setup-admin"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
index c6e225c8ce75..255439acd5f8 100644
--- a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
+++ b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
@@ -10,8 +10,8 @@ SRC_URI = "git://github.com/unbit/uwsgi.git;branch=uwsgi-2.0;protocol=https \
     file://more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch \
 "
 
-SRCREV="af44211739136e22471a2897383f34586284bf86"
-PV="2.0.14+git${SRCPV}"
+SRCREV = "af44211739136e22471a2897383f34586284bf86"
+PV = "2.0.14+git${SRCPV}"
 
 inherit setuptools3 pkgconfig
 
diff --git a/meta-openstack/recipes-support/salt/salt_3001.1.bb b/meta-openstack/recipes-support/salt/salt_3001.1.bb
index 967ee6fc85cb..101ce21d2586 100644
--- a/meta-openstack/recipes-support/salt/salt_3001.1.bb
+++ b/meta-openstack/recipes-support/salt/salt_3001.1.bb
@@ -95,13 +95,13 @@ CONFFILES:${PN}-minion = "${sysconfdir}/${PN}/minion"
 FILES:${PN}-minion = "${bindir}/${PN}-minion ${sysconfdir}/${PN}/minion.d/ ${CONFFILES_${PN}-minion} ${bindir}/${PN}-proxy ${systemd_system_unitdir}/salt-minion.service"
 
 SUMMARY:${PN}-common = "shared libraries that salt requires for all packages"
-DESCRIPTION:${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
+DESCRIPTION:${PN}-common = "${DESCRIPTION_COMMON} This particular package provides shared libraries that \
 salt-master, salt-minion, and salt-syndic require to function."
 RDEPENDS:${PN}-common = "python3-dateutil python3-jinja2 python3-pyyaml python3-requests (>= 1.0.0) python3-distro"
 RRECOMMENDS:${PN}-common = "lsb-release"
 RSUGGESTS:${PN}-common = "python3-mako python3-git"
 RCONFLICTS:${PN}-common = "python3-mako (< 0.7.0)"
-CONFFILES:${PN}-common="${sysconfdir}/logrotate.d/${PN}"
+CONFFILES:${PN}-common = "${sysconfdir}/logrotate.d/${PN}"
 FILES:${PN}-common = "${bindir}/${PN}-call ${PYTHON_SITEPACKAGES_DIR}/* ${CONFFILES_${PN}-common}"
 
 SUMMARY:${PN}-ssh = "remote manager to administer servers via salt"
@@ -109,7 +109,7 @@ DESCRIPTION:${PN}-ssh = "${DESCRIPTION_COMMON} This particular package provides
 is able to run salt modules and states on remote hosts via ssh. No minion or other salt specific software needs\
  to be installed on the remote host."
 RDEPENDS:${PN}-ssh = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack"
-CONFFILES:${PN}-ssh="${sysconfdir}/${PN}/roster"
+CONFFILES:${PN}-ssh = "${sysconfdir}/${PN}/roster"
 FILES:${PN}-ssh = "${bindir}/${PN}-ssh ${CONFFILES_${PN}-ssh}"
 
 SUMMARY:${PN}-api = "generic, modular network access system"
@@ -124,11 +124,11 @@ CONFFILES:${PN}-api = "${sysconfdir}/init.d/${PN}-api"
 FILES:${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api} ${systemd_system_unitdir}/${PN}-api.service"
 
 SUMMARY:${PN}-master = "remote manager to administer servers via salt"
-DESCRIPTION:${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
+DESCRIPTION:${PN}-master = "${DESCRIPTION_COMMON} This particular package provides the salt controller."
 RDEPENDS:${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack python3-pycryptodomex (>= 3.9.7)"
 RDEPENDS:${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python3-pycrypto python3-pyzmq (>= 13.1.0)', '',d)}"
 RDEPENDS:${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python3-pycrypto', '',d)}"
-CONFFILES:${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
+CONFFILES:${PN}-master = "${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
 RSUGGESTS:${PN}-master = "python3-git"
 FILES:${PN}-master = "${bindir}/${PN} ${bindir}/${PN}-cp ${bindir}/${PN}-key ${bindir}/${PN}-master ${bindir}/${PN}-run ${bindir}/${PN}-unity ${bindir}/spm ${CONFFILES_${PN}-master} ${systemd_system_unitdir}/${PN}-master.service"
 
@@ -136,7 +136,7 @@ SUMMARY:${PN}-syndic = "master-of-masters for salt, the distributed remote execu
 DESCRIPTION:${PN}-syndic = "${DESCRIPTION_COMMON} This particular package provides the master of masters for \
 salt; it enables the management of multiple masters at a time."
 RDEPENDS:${PN}-syndic = "${PN}-master (= ${EXTENDPKGV})"
-CONFFILES:${PN}-syndic="${sysconfdir}/init.d/${PN}-syndic"
+CONFFILES:${PN}-syndic = "${sysconfdir}/init.d/${PN}-syndic"
 FILES:${PN}-syndic = "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic} ${systemd_system_unitdir}/${PN}-syndic.service"
 
 SUMMARY:${PN}-cloud = "public cloud VM management system"
@@ -147,7 +147,7 @@ CONFFILES:${PN}-cloud = "${sysconfdir}/${PN}/cloud"
 FILES:${PN}-cloud = "${bindir}/${PN}-cloud ${sysconfdir}/${PN}/cloud.conf.d/ ${sysconfdir}/${PN}/cloud.profiles.d/ ${sysconfdir}/${PN}/cloud.providers.d/ ${CONFFILES_${PN}-cloud}"
 
 SUMMARY:${PN}-tests = "salt stack test suite"
-DESCRIPTION:${PN}-tests ="${DESCRIPTION_COMMON} This particular package provides the salt unit test suite."
+DESCRIPTION:${PN}-tests = "${DESCRIPTION_COMMON} This particular package provides the salt unit test suite."
 RDEPENDS:${PN}-tests = "${PN}-common python3-pytest-salt python3-tests python3-image bash"
 FILES:${PN}-tests = "${PYTHON_SITEPACKAGES_DIR}/salt-tests/tests/"
 
-- 
2.50.0


