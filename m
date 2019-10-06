Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B91A8E00D4A; Sun,  6 Oct 2019 13:48:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65316E008C8
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2019 13:48:20 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 07E605C1D4B;
	Sun,  6 Oct 2019 22:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570394899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Jgp2CWRBv3knH2iC6G9f3/B+pGHe//gf2NkhGBNOm7M=;
	b=roFnx0rr2vGBr5NyF7pKfwuf4U+rAa9gPWOFhApLNAOLWMcfbh8BuYmC8IvbyS4pHFUQjj
	FXFKK64qmxNtj7ekXQm79x0YcRBsX0iw2iEj/lEtvhayKyEeRty1DCrzIH4iDxxzDsj2R7
	aZWMDC/eTU4pbMMGZhR47vEjnmF+DvE=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2019 22:47:46 +0200
Message-Id: <20191006204748.15783-3-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191006204748.15783-1-stefan@agner.ch>
References: <20191006204748.15783-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 3/5] skopeo: add default set of configuration files
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Oct 2019 20:48:22 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Add a default registries.conf and storage.conf. Those config files
are used by several projects of the containers group like buildah or
podman. Provide it as part of skopeo like the other distributions do.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../skopeo/files/registries.conf              |  25 ++++
 recipes-containers/skopeo/files/storage.conf  | 133 ++++++++++++++++++
 recipes-containers/skopeo/skopeo_git.bb       |   9 +-
 3 files changed, 166 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/skopeo/files/registries.conf
 create mode 100644 recipes-containers/skopeo/files/storage.conf

diff --git a/recipes-containers/skopeo/files/registries.conf b/recipes-containers/skopeo/files/registries.conf
new file mode 100644
index 0000000..ba6c3f6
--- /dev/null
+++ b/recipes-containers/skopeo/files/registries.conf
@@ -0,0 +1,25 @@
+# This is a system-wide configuration file used to
+# keep track of registries for various container backends.
+# It adheres to TOML format and does not support recursive
+# lists of registries.
+
+# The default location for this configuration file is /etc/containers/registries.conf.
+
+# The only valid categories are: 'registries.search', 'registries.insecure', 
+# and 'registries.block'.
+
+[registries.search]
+registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com', 'registry.centos.org']
+
+# If you need to access insecure registries, add the registry's fully-qualified name.
+# An insecure registry is one that does not have a valid SSL certificate or only does HTTP.
+[registries.insecure]
+registries = []
+
+
+# If you need to block pull access from a registry, uncomment the section below
+# and add the registries fully-qualified name.
+#
+# Docker only
+[registries.block]
+registries = []
diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
new file mode 100644
index 0000000..818cfe8
--- /dev/null
+++ b/recipes-containers/skopeo/files/storage.conf
@@ -0,0 +1,133 @@
+# This file is is the configuration file for all tools
+# that use the containers/storage library.
+# See man 5 containers-storage.conf for more information
+# The "container storage" table contains all of the server options.
+[storage]
+
+# Default Storage Driver
+driver = "overlay"
+
+# Temporary storage location
+runroot = "/var/run/containers/storage"
+
+# Primary Read/Write location of container storage
+graphroot = "/var/lib/containers/storage"
+
+[storage.options]
+# Storage options to be passed to underlying storage drivers
+
+# AdditionalImageStores is used to pass paths to additional Read/Only image stores
+# Must be comma separated list.
+additionalimagestores = [
+]
+
+# Size is used to set a maximum size of the container image.  Only supported by
+# certain container storage drivers.
+size = ""
+
+# Path to an helper program to use for mounting the file system instead of mounting it
+# directly.
+#mount_program = "/usr/bin/fuse-overlayfs"
+
+# OverrideKernelCheck tells the driver to ignore kernel checks based on kernel version
+override_kernel_check = "true"
+
+# mountopt specifies comma separated list of extra mount options
+mountopt = "nodev"
+
+# Remap-UIDs/GIDs is the mapping from UIDs/GIDs as they should appear inside of
+# a container, to UIDs/GIDs as they should appear outside of the container, and
+# the length of the range of UIDs/GIDs.  Additional mapped sets can be listed
+# and will be heeded by libraries, but there are limits to the number of
+# mappings which the kernel will allow when you later attempt to run a
+# container.
+#
+# remap-uids = 0:1668442479:65536
+# remap-gids = 0:1668442479:65536
+
+# Remap-User/Group is a name which can be used to look up one or more UID/GID
+# ranges in the /etc/subuid or /etc/subgid file.  Mappings are set up starting
+# with an in-container ID of 0 and the a host-level ID taken from the lowest
+# range that matches the specified name, and using the length of that range.
+# Additional ranges are then assigned, using the ranges which specify the
+# lowest host-level IDs first, to the lowest not-yet-mapped container-level ID,
+# until all of the entries have been used for maps.
+#
+# remap-user = "storage"
+# remap-group = "storage"
+
+[storage.options.thinpool]
+# Storage Options for thinpool
+
+# autoextend_percent determines the amount by which pool needs to be
+# grown. This is specified in terms of % of pool size. So a value of 20 means
+# that when threshold is hit, pool will be grown by 20% of existing
+# pool size.
+# autoextend_percent = "20"
+
+# autoextend_threshold determines the pool extension threshold in terms
+# of percentage of pool size. For example, if threshold is 60, that means when
+# pool is 60% full, threshold has been hit.
+# autoextend_threshold = "80"
+
+# basesize specifies the size to use when creating the base device, which
+# limits the size of images and containers.
+# basesize = "10G"
+
+# blocksize specifies a custom blocksize to use for the thin pool.
+# blocksize="64k"
+
+# directlvm_device specifies a custom block storage device to use for the
+# thin pool. Required if you setup devicemapper.
+# directlvm_device = ""
+
+# directlvm_device_force wipes device even if device already has a filesystem.
+# directlvm_device_force = "True"
+
+# fs specifies the filesystem type to use for the base device.
+# fs="xfs"
+
+# log_level sets the log level of devicemapper.
+# 0: LogLevelSuppress 0 (Default)
+# 2: LogLevelFatal
+# 3: LogLevelErr
+# 4: LogLevelWarn
+# 5: LogLevelNotice
+# 6: LogLevelInfo
+# 7: LogLevelDebug
+# log_level = "7"
+
+# min_free_space specifies the min free space percent in a thin pool require for
+# new device creation to succeed. Valid values are from 0% - 99%.
+# Value 0% disables
+# min_free_space = "10%"
+
+# mkfsarg specifies extra mkfs arguments to be used when creating the base.
+# device.
+# mkfsarg = ""
+
+# use_deferred_removal marks devicemapper block device for deferred removal.
+# If the thinpool is in use when the driver attempts to remove it, the driver 
+# tells the kernel to remove it as soon as possible. Note this does not free
+# up the disk space, use deferred deletion to fully remove the thinpool.
+# use_deferred_removal = "True"
+
+# use_deferred_deletion marks thinpool device for deferred deletion.
+# If the device is busy when the driver attempts to delete it, the driver
+# will attempt to delete device every 30 seconds until successful.
+# If the program using the driver exits, the driver will continue attempting
+# to cleanup the next time the driver is used. Deferred deletion permanently
+# deletes the device and all data stored in device will be lost.
+# use_deferred_deletion = "True"
+
+# xfs_nospace_max_retries specifies the maximum number of retries XFS should
+# attempt to complete IO when ENOSPC (no space) error is returned by
+# underlying storage device.
+# xfs_nospace_max_retries = "0"
+
+# If specified, use OSTree to deduplicate files with the overlay backend
+ostree_repo = ""
+
+# Set to skip a PRIVATE bind mount on the storage home directory.  Only supported by
+# certain container storage drivers
+skip_mount_home = "false"
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 82d3f23..f5a6231 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -19,7 +19,11 @@ RDEPENDS_${PN} = " \
      libassuan \
 "
 
-SRC_URI = "git://github.com/containers/skopeo"
+SRC_URI = " \
+    git://github.com/containers/skopeo \
+    file://storage.conf \
+    file://registries.conf \
+"
 
 SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
 PV = "v0.1.39-dev+git${SRCPV}"
@@ -68,6 +72,9 @@ do_install() {
 
 	install ${S}/src/import/skopeo ${D}/${sbindir}/
 	install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
+
+	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
+	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
 }
 
 INSANE_SKIP_${PN} += "ldflags"
-- 
2.20.1


