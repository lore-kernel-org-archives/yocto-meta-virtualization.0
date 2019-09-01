Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E0F8E00D60; Sun,  1 Sep 2019 13:33:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53DEFE00A5C
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 13:33:41 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9E2B35C01D2;
	Sun,  1 Sep 2019 22:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567370020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=e2q48dTGWozNUx710lYv/+hlpHfy/ifl9v/wyptsG0M=;
	b=fnRQs+PjEDZOEUgtwuq9oQxU3eQhHgvfUOwJfIhawmIFWT4it6b/r2SLhzn9BAA0BMZtZ7
	SwVNYQttDaXplFPSdcU2UJzDr6NozNye0jv+WEPdzmlxAlzxjURDarS7zQaa4vYZG9e6UN
	7Cb8SFvqI771k0qbY73mxyAfVGZRj4o=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Sun,  1 Sep 2019 22:33:32 +0200
Message-Id: <20190901203338.38768-1-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 0/6] podman: add initial recipe
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
X-List-Received-Date: Sun, 01 Sep 2019 20:33:44 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

This adds Podman a daemonless container engine for developing,
managing, and running OCI Containers on your Linux System.
Containers can either be run as root or in rootless mode.
Simply put: `alias docker=podman`.

Currently a minimal set of features is supported. It requires
meta-security since libseccomp seems to be mandatory.

--
Stefan

Stefan Agner (6):
  conmon: initial add
  go-metalinter: add recipe for gometalinter
  go-md2man: add md2man
  skopeo: add skopeo
  cni: move cni tools to /usr/lib/cni
  podmon: add the Pod Manager tool

 recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++
 ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++
 recipes-containers/cri-o/files/crio.conf      |  2 +-
 recipes-containers/podman/podman_git.bb       | 91 +++++++++++++++++++
 recipes-containers/skopeo/skopeo_git.bb       | 73 +++++++++++++++
 recipes-devtools/go/go-md2man_git.bb          | 20 ++++
 recipes-devtools/go/go-metalinter_git.bb      | 24 +++++
 recipes-networking/cni/cni_git.bb             |  4 +-
 8 files changed, 272 insertions(+), 3 deletions(-)
 create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
 create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
 create mode 100644 recipes-containers/podman/podman_git.bb
 create mode 100644 recipes-containers/skopeo/skopeo_git.bb
 create mode 100644 recipes-devtools/go/go-md2man_git.bb
 create mode 100644 recipes-devtools/go/go-metalinter_git.bb

-- 
2.20.1


