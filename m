Return-Path: <raitosyo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201F2C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:28:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.22102.1752672499077793430
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 06:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TZrDu65V;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raitosyo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-237e6963f63so39360755ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752672498; x=1753277298; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsixYClx3NlZW+EEyC/yE74pkMp3i9rpuBrrf9oGYOY=;
        b=TZrDu65VoU5KyVNCs3EtohS1mLL12/iSuN7nbm0U/AHnF2YrhwcSc3IlS6u0AOHDEy
         RWjXDYUrOcdnzgnMOCrfe9RDmpdNPU5UvkhAcph9B3LLHCV5sDUed9x5WcB7mJxuGyl2
         Q9aav4PheEU6A6peyttwDG0MrmYwx7FP1sPNepViquF8xisV+PlJWuqDLpoJp9W+XGJm
         mHoRBNrxHnwTfbaBaS3hjum7F8E6aeODMAzR0yHZGmJ9SS9M28wAJ5Hnbo0ghvhMWRqB
         GFgmqkFEpevYGx+9vtAmBMEB4dc4m301vVaPvPl9A+WMiiQPHQD7y9huWQqeATDOVovy
         jiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672498; x=1753277298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsixYClx3NlZW+EEyC/yE74pkMp3i9rpuBrrf9oGYOY=;
        b=K0K71Mr0DKhaE7QU+lW9SXS1GnS2W5Hvw08MeQLZB5Ex+A391RkbdoNSCET5pQs5mm
         O5B1FV74ujj1PdpMicunpC33FxkCG97CXnOmeg5jhuzvMFYe+de0Ri9lH0ZUXj1rfET8
         c1k6MNuXpLZl0Zvoq109DeencakEX4nRFkGahe7D2FXThH3jJpwbSldPLX2mVz0KWC1Z
         Yd3jOVvCNxjSurEm6y7hTxn9/2kvfa1sCkpMBesV5mw1lb1GA7p/nnQoUy6oLeuXDg0c
         oaicey2nizL+JOAcQT/e5U3loWQzM95RGPai9EnMiJiOLtOutJnLuyQr0SQZpBbrt/JY
         SI0Q==
X-Gm-Message-State: AOJu0YywqhdInNKirFlmVzRv5hzU/oeBW3nSlyxCXTwemj0ln8mQmkKL
	AL/mzAV9/k2Oj6u7HtaIJ8s1AfK1i7XfM5+jA3C6FUV2tdkKKFJreodhulSUKg==
X-Gm-Gg: ASbGncv/G4IaTmnkxKYUn8tZP7Z9oLr0/mNIECHp1okX0Fx+SVSjX1box/1Nrua1r6B
	CE8Cux8VYlwG+ztOoDPPmSuMmYF8btEb/LfU1OBUsToR7FloIMi6JxWARS1svOkEGiH/XPmIVX1
	X0GCjet+BfkuAVyDKjSpPKaQp0vbx3ag2AQolzs+ZNkxzA/enY3Bo1duh/Rf9gJS0abbVeSwYyU
	K2kQUzpgUySpv4xdMyAwyvo3UZQ/33M9FkbE2ffnxRshAttxo7OzzLSINm+FeHe2W/vDheg7xQF
	Z+giFXxKOxvvDqM/I4MsHq78JvoAoIPt7FIhhRs47rKojlqENrix0j4vDyMrTCPtawOD4lENLtl
	Yjhm4y+Si8xw7F5I=
X-Google-Smtp-Source: AGHT+IGsto8Cv0OD8aQfioIKyUlrXaaQO5s4XLVBWe53KZfsotRVAqatW9ceXZvapeEtMhmyzcZ79w==
X-Received: by 2002:a17:90b:51c3:b0:311:e731:523a with SMTP id 98e67ed59e1d1-31c9f44b9cemr4095168a91.11.1752672497837;
        Wed, 16 Jul 2025 06:28:17 -0700 (PDT)
Received: from fedora ([240d:1a:3a7:a400:9a57:aa11:487a:b54f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1fba76sm1517123a91.26.2025.07.16.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:28:17 -0700 (PDT)
From: Ryosuke Saito <raitosyo@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: raitosyo@gmail.com
Subject: [meta-virtualization][m-c-s][PATCH] meta-openstack: Add whitespaces around variable assignments
Date: Wed, 16 Jul 2025 22:28:08 +0900
Message-ID: <20250716132808.694578-1-raitosyo@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 13:28:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9311

From: Ryosuke Saito <ryosuke.saito@linaro.org>

Silence QA warnings about missing spaces around the assignments:

WARNING: python-ceilometer_git.bb:25 has a lack of whitespace around the assignment:
 'KEYSTONE_HOST="${CONTROLLER_IP}"'
WARNING: python-cinder_git.bb:39 has a lack of whitespace around the assignment:
 'KEYSTONE_HOST="${CONTROLLER_IP}"'
...

Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
---
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
index c71229d421af..7a07f04a4385 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 inherit update-rc.d setuptools3 identity hosts useradd default_configs monitor
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
index ca5d62f3b648..537a854fe8e2 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer_git.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 CEILOMETER_SECRET ?= "12121212"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-reseller"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index 2a3ef47be906..44d6250e4438 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -36,7 +36,7 @@ USERADD_PARAM:${PN} = "--system -m -d ${localstatedir}/lib/cinder -s /bin/false
 
 CINDER_BACKUP_BACKEND_DRIVER ?= "cinder.backup.drivers.swift"
 
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 CINDER_LVM_VOLUME_BACKING_FILE_SIZE ?= "2G"
 CINDER_NFS_VOLUME_SERVERS_DEFAULT = "controller:/etc/cinder/nfs_volumes"
diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
index bd360edfe6a8..8f4b69cd5d9e 100644
--- a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
@@ -12,8 +12,8 @@ SRC_URI = "\
 	file://cinder-api-check.sh \
 	"
 
-PV="3.1.0+git${SRCPV}"
-SRCREV="3640aeab6e11987288a2f149fbeedb1c026045e2"
+PV = "3.1.0+git${SRCPV}"
+SRCREV = "3640aeab6e11987288a2f149fbeedb1c026045e2"
 S = "${WORKDIR}/git"
 
 inherit setuptools3 monitor
diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index 9fa23ed8dcdc..73142cc0e3d3 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -37,7 +37,7 @@ GLANCE_KNOWN_STORES ?= "glance.store.rbd.Store,\
 
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
index 00709283a652..0a483e0c3ede 100644
--- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
@@ -20,7 +20,7 @@ PV = "5.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-templates ${SRCNAME}-cfn"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
index 0c153805d322..a54f65216225 100644
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
index 72f5a04d8664..e316ab05d808 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone-hybrid-backend_git.bb
@@ -8,8 +8,8 @@ PR = "r0"
 
 SRC_URI = "git://github.com/SUSE-Cloud/keystone-hybrid-backend.git;branch=havana;protocol=https"
 
-PV="git${SRCPV}"
-SRCREV="0bd376242f8522edef7031d2339b9533b86c17aa"
+PV = "git${SRCPV}"
+SRCREV = "0bd376242f8522edef7031d2339b9533b86c17aa"
 S = "${WORKDIR}/git"
 
 inherit python3-dir
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index a1b5dd0bb339..6470438daa53 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -37,7 +37,7 @@ USERADD_PARAM:${PN} = "--system -m -s /bin/false keystone"
 LDAP_DN ?= "dc=my-domain,dc=com"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be
 # set.  If the flag for a parameter in the list is not set here, the default
diff --git a/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb b/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb
index 343942f4484a..5835f74cd2fd 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron-lib_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://git.openstack.org/openstack/neutron-lib.git;branch=stable/pike \
 	"
 
-PV="1.9.1+git${SRCPV}"
-SRCREV="f0d7e470c2ef1702b2715ceb2fd8a00fce2a23be"
+PV = "1.9.1+git${SRCPV}"
+SRCREV = "f0d7e470c2ef1702b2715ceb2fd8a00fce2a23be"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index 11dbb843824f..f67c62b72ea2 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -42,7 +42,7 @@ GROUPADD_PARAM:${PN} = "--system ${GROUP}"
 USERADD_PARAM:${PN} = "--system -m -d ${localstatedir}/lib/neutron -s /bin/false -g ${GROUP} ${USER}"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index 7afe347d7bb3..a8245708b838 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -53,7 +53,7 @@ USERADD_PARAM:${PN} = "--system -m -d ${localstatedir}/lib/nova -s /bin/false -g
 PLACEMENT_USER = "placement"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-ec2"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-rally_git.bb b/meta-openstack/recipes-devtools/python/python-rally_git.bb
index 9327ff509e8a..b814da3202d0 100644
--- a/meta-openstack/recipes-devtools/python/python-rally_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-rally_git.bb
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/stackforge/${SRCNAME}.git;branch=master;protocol=htt
            file://verification-subunit2json-fail-to-open-result-file.patch \
 "
 
-SRCREV="b297cf00750f263b8b5bdeb71f6952f672e87f5a"
-PV="git${SRCPV}"
+SRCREV = "b297cf00750f263b8b5bdeb71f6952f672e87f5a"
+PV = "git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit setuptools3 update-rc.d hosts identity default_configs
diff --git a/meta-openstack/recipes-devtools/python/python-swift_git.bb b/meta-openstack/recipes-devtools/python/python-swift_git.bb
index a62d6ab2c569..bd2ab7147bd8 100644
--- a/meta-openstack/recipes-devtools/python/python-swift_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-swift_git.bb
@@ -16,8 +16,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master;protocol=http
            file://cluster.conf \
 "
 
-SRCREV="4ca08cc395e686265574366497a6869e94eebcb2"
-PV="2.2.2+git${SRCPV}"
+SRCREV = "4ca08cc395e686265574366497a6869e94eebcb2"
+PV = "2.2.2+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit setuptools3 python3-dir update-rc.d hosts identity
@@ -30,7 +30,7 @@ inherit setuptools3 python3-dir update-rc.d hosts identity
 SWIFT_BACKING_FILE_SIZE ?= "2G"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-devtools/python/python-trove_git.bb b/meta-openstack/recipes-devtools/python/python-trove_git.bb
old mode 100755
new mode 100644
index b9045e2c331a..5e3105ba76e2
--- a/meta-openstack/recipes-devtools/python/python-trove_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-trove_git.bb
@@ -10,14 +10,14 @@ SRC_URI = "git://github.com/openstack/trove.git;branch=master;protocol=https \
           file://trove-init \
           "
 
-SRCREV="11996635299396f181f5aec3c6825f8011d45e2c"
-PV="4.0.0+git${SRCPV}"
+SRCREV = "11996635299396f181f5aec3c6825f8011d45e2c"
+PV = "4.0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit update-rc.d setuptools3 identity hosts useradd default_configs
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be
 # set.  If the flag for a parameter in the list is not set here, the default
diff --git a/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb b/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
index 7dc729cf0896..92a1bd13389f 100644
--- a/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-glance-store_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://git.openstack.org/openstack/glance_store.git;branch=stable/pike \
 	"
 
-PV="0.22.0+git${SRCPV}"
-SRCREV="49c915f498fc8d91c98fcf4e07ceecdcf167fc5a"
+PV = "0.22.0+git${SRCPV}"
+SRCREV = "49c915f498fc8d91c98fcf4e07ceecdcf167fc5a"
 S = "${WORKDIR}/git"
 
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
index 193f80e748db..6abfd0dc4085 100644
--- a/meta-openstack/recipes-devtools/python/python3-taskflow_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-taskflow_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 	git://git.openstack.org/openstack/taskflow.git;branch=stable/pike \
 	"
 
-PV="2.14.1+git${SRCPV}"
-SRCREV="ed867c4fd17e4102a133c313a13af37baccf14a4"
+PV = "2.14.1+git${SRCPV}"
+SRCREV = "ed867c4fd17e4102a133c313a13af37baccf14a4"
 S = "${WORKDIR}/git"
 
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
index 9d8bfc68856a..d7b44e7d82d1 100644
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
index 4854516c88bb..c34c89ba546a 100644
--- a/meta-openstack/recipes-extended/tempest/tempest_git.bb
+++ b/meta-openstack/recipes-extended/tempest/tempest_git.bb
@@ -14,12 +14,12 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master;protocol=http
            file://logging.conf \
 "
 
-SRCREV="2707a0f065e52d8331d12c983ead95de1224cb32"
-PV="2014.1+git${SRCPV}"
+SRCREV = "2707a0f065e52d8331d12c983ead95de1224cb32"
+PV = "2014.1+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 SERVICECREATE_PACKAGES = "${SRCNAME}-setup ${SRCNAME}-setup-altdemo ${SRCNAME}-setup-admin"
-KEYSTONE_HOST="${CONTROLLER_IP}"
+KEYSTONE_HOST = "${CONTROLLER_IP}"
 
 # USERCREATE_PARAM and SERVICECREATE_PARAM contain the list of parameters to be set.
 # If the flag for a parameter in the list is not set here, the default value will be given to that parameter.
diff --git a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
index 62e0df42d698..022f52a04c15 100644
--- a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
+++ b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
@@ -10,8 +10,8 @@ SRC_URI = "git://github.com/unbit/uwsgi.git;branch=uwsgi-2.0;protocol=https \
     file://more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch \
 "
 
-SRCREV="af44211739136e22471a2897383f34586284bf86"
-PV="2.0.14+git${SRCPV}"
+SRCREV = "af44211739136e22471a2897383f34586284bf86"
+PV = "2.0.14+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit setuptools3 pkgconfig
diff --git a/meta-openstack/recipes-support/salt/salt_3001.1.bb b/meta-openstack/recipes-support/salt/salt_3001.1.bb
index 4a77fb81bc2d..7fba93c17231 100644
--- a/meta-openstack/recipes-support/salt/salt_3001.1.bb
+++ b/meta-openstack/recipes-support/salt/salt_3001.1.bb
@@ -96,13 +96,13 @@ CONFFILES:${PN}-minion = "${sysconfdir}/${PN}/minion"
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
@@ -110,7 +110,7 @@ DESCRIPTION:${PN}-ssh = "${DESCRIPTION_COMMON} This particular package provides
 is able to run salt modules and states on remote hosts via ssh. No minion or other salt specific software needs\
  to be installed on the remote host."
 RDEPENDS:${PN}-ssh = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack"
-CONFFILES:${PN}-ssh="${sysconfdir}/${PN}/roster"
+CONFFILES:${PN}-ssh = "${sysconfdir}/${PN}/roster"
 FILES:${PN}-ssh = "${bindir}/${PN}-ssh ${CONFFILES_${PN}-ssh}"
 
 SUMMARY:${PN}-api = "generic, modular network access system"
@@ -126,11 +126,11 @@ FILES:${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api} ${systemd_system_u
 
 
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
 
@@ -139,7 +139,7 @@ SUMMARY:${PN}-syndic = "master-of-masters for salt, the distributed remote execu
 DESCRIPTION:${PN}-syndic = "${DESCRIPTION_COMMON} This particular package provides the master of masters for \
 salt; it enables the management of multiple masters at a time."
 RDEPENDS:${PN}-syndic = "${PN}-master (= ${EXTENDPKGV})"
-CONFFILES:${PN}-syndic="${sysconfdir}/init.d/${PN}-syndic"
+CONFFILES:${PN}-syndic = "${sysconfdir}/init.d/${PN}-syndic"
 FILES:${PN}-syndic = "${bindir}/${PN}-syndic ${CONFFILES_${PN}-syndic} ${systemd_system_unitdir}/${PN}-syndic.service"
 
 SUMMARY:${PN}-cloud = "public cloud VM management system"
@@ -150,7 +150,7 @@ CONFFILES:${PN}-cloud = "${sysconfdir}/${PN}/cloud"
 FILES:${PN}-cloud = "${bindir}/${PN}-cloud ${sysconfdir}/${PN}/cloud.conf.d/ ${sysconfdir}/${PN}/cloud.profiles.d/ ${sysconfdir}/${PN}/cloud.providers.d/ ${CONFFILES_${PN}-cloud}"
 
 SUMMARY:${PN}-tests = "salt stack test suite"
-DESCRIPTION:${PN}-tests ="${DESCRIPTION_COMMON} This particular package provides the salt unit test suite."
+DESCRIPTION:${PN}-tests = "${DESCRIPTION_COMMON} This particular package provides the salt unit test suite."
 RDEPENDS:${PN}-tests = "${PN}-common python3-pytest-salt python3-tests python3-image bash"
 FILES:${PN}-tests = "${PYTHON_SITEPACKAGES_DIR}/salt-tests/tests/"
 
-- 
2.50.0


