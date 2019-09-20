Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1D30E00D8F; Fri, 20 Sep 2019 00:18:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CD6FE00D54
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 00:18:12 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id AB4B85C0623;
	Fri, 20 Sep 2019 09:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568963891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=lwX/ol/pftuV5BmSE67FLQ/qvVTJVKVz2UvlWvkIedg=;
	b=trf+RGeOBAOe8D4JV6xcpH912F0oDXn8Qfa7EXTEB/VvSzz/KqQ9OVmxhrkWeAJynJFzV5
	RaYeyba8ArK6m89K5ug5SvjuMA/WLlvrCCnWeGpLxq9Cv75xdGbJ8RlE0a9jNw1OpGP/TL
	zoNuE7gmR3YmR2+YI2lHAcs2y366ST0=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Fri, 20 Sep 2019 09:18:00 +0200
Message-Id: <20190920071807.13139-1-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2 0/7] podman: add initial recipe
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
X-List-Received-Date: Fri, 20 Sep 2019 07:18:13 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

This adds Podman a daemonless container engine for developing,
managing, and running OCI Containers on your Linux System.
Containers can either be run as root or in rootless mode.
Simply put: `alias docker=podman`.

Currently the build tags systemd (if in DISTRO_FEATURES),
seccomp, varlink and remoteclient are enabled which allows to
run podman with overlayfs as root and vfs in rootless mode.
The storage drivers btrfs and device-mapper have not been
tested and are disabled at the moment.

--
Stefan

Changes in v2:
- Add slirp4netns recipe for rootless networking support
- Fix podman recipe to build properly (set GOARCH properly)
- Fix podman recipe commit message and comments
- Add varlink and remoteclient to build tags
- Move cni binaries to /usr/libexec/cni and create symlink for /opt/cni/bin

Stefan Agner (7):
  conmon: initial add
  go-metalinter: add recipe for gometalinter
  go-md2man: add md2man
  skopeo: add skopeo
  cni: move cni tools to /usr/libexec/cni
  slirp4netns: add slirp4netns user-mode networking
  podman: add the Pod Manager tool

 recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++
 ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++
 recipes-containers/cri-o/files/crio.conf      |  2 +-
 recipes-containers/podman/podman_git.bb       | 93 +++++++++++++++++++
 recipes-containers/skopeo/skopeo_git.bb       | 73 +++++++++++++++
 recipes-devtools/go/go-md2man_git.bb          | 20 ++++
 recipes-devtools/go/go-metalinter_git.bb      | 24 +++++
 recipes-networking/cni/cni_git.bb             |  8 +-
 .../slirp4netns/slirp4netns_0.4.1.bb          | 16 ++++
 9 files changed, 294 insertions(+), 3 deletions(-)
 create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
 create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
 create mode 100644 recipes-containers/podman/podman_git.bb
 create mode 100644 recipes-containers/skopeo/skopeo_git.bb
 create mode 100644 recipes-devtools/go/go-md2man_git.bb
 create mode 100644 recipes-devtools/go/go-metalinter_git.bb
 create mode 100644 recipes-networking/slirp4netns/slirp4netns_0.4.1.bb

-- 
2.20.1


