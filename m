Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C33BBE00C34; Mon, 17 Jul 2017 13:04:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53AB0E00C2E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:15 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6HK4Fhf004442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:15 -0700
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:01 -0400
Message-ID: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
MIME-Version: 1.0
Subject: [PATCH 00/12] FYI: consolidated merge series
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
X-List-Received-Date: Mon, 17 Jul 2017 20:04:16 -0000
Content-Type: text/plain

Hi all,

There's been some ongoing work to get OVS updated to a python3 only
version, updates to get docker + runc to be something more recent and
some other various fixes.

All of these need to work together or we end up breaking docker, runc
and users of the various runtimes that we don't know about.

I just finished testing the latest runc + oci tools + docker + ovs py3
and the smoke tests are passing.

I'm sending out this FYI series which will merge shortly.

Cheers,

Bruce


Bruce Ashfield (3):
  oci-runtime-tools: skip ld checks
  docker: update version string to 17.06.0
  containerd: uprev to latest 0.2.x

Jan Kiszka (2):
  lxc: Fix INITSCRIPT_PARAMS value
  docker: Fix and update sysvinit script

Jason Wessel (5):
  runc-docker: Uprev to 1.0-rc3+
  runc-docker: Add --console-socket=/dev/null
  docker: Uprev to latest based on runc 1.0-rc3
  oci-systemd-hook: Uprev hook to latest
  oci-runtime-tools, oci-runtime-spec: Uprev to runc 1.0-rc3 versions

Mark Asselstine (2):
  openvswitch: uprev to v2.7.1
  openvswitch: backport py3 fixups

 .../containerd/containerd-docker_git.bb            |   14 +-
 recipes-containers/containerd/containerd.inc       |   30 +-
 .../containerd/files/containerd.service            |   11 +
 recipes-containers/docker/docker_git.bb            |   18 +-
 ...-golang.org-x-net-pkg-until-we-move-to-go.patch |   57 +-
 recipes-containers/docker/files/docker.init        |    5 +-
 recipes-containers/lxc/lxc_2.0.8.bb                |    2 +-
 .../oci-runtime-spec/oci-runtime-spec_git.bb       |    6 +-
 .../oci-runtime-tools/oci-runtime-tools_git.bb     |   14 +-
 .../0001-selinux-drop-selinux-support.patch        |   35 +-
 .../oci-systemd-hook/oci-systemd-hook_git.bb       |    2 +-
 ...untime-spec-198f23f827eea397d4331d7eb048d.patch |   89 ++
 .../0001-runc-Add-console-socket-dev-null.patch    |   33 +
 ...-Remove-Platform-as-no-longer-in-OCI-spec.patch |   75 ++
 ...date-memory-specs-to-use-int64-not-uint64.patch |  194 +++
 recipes-containers/runc/runc-docker_git.bb         |   10 +-
 recipes-containers/runc/runc.inc                   |    4 +
 ...gure-Only-link-against-libpcap-on-FreeBSD.patch |   70 --
 ...n3-compatibility-Convert-print-statements.patch | 1264 ++++++++++++++++++++
 ...2-Python3-compatibility-exception-cleanup.patch |   79 ++
 ...03-Python3-compatibility-execfile-to-exec.patch |   33 +
 ...-Python3-compatibility-iteritems-to-items.patch |  102 ++
 ...ython3-compatibility-fix-integer-problems.patch |   51 +
 ...n3-compatibility-math-error-compatibility.patch |   56 +
 ...0007-Python3-compatibility-unicode-to-str.patch |   51 +
 .../0008-AUTHORS-Add-Jason-Wessel.patch            |   28 +
 ...-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch |  110 ++
 ...-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch |  110 --
 recipes-networking/openvswitch/openvswitch.inc     |    1 -
 recipes-networking/openvswitch/openvswitch_git.bb  |   17 +-
 30 files changed, 2283 insertions(+), 288 deletions(-)
 create mode 100644 recipes-containers/containerd/files/containerd.service
 create mode 100644 recipes-containers/runc/runc-docker/0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch
 create mode 100644 recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
 create mode 100644 recipes-containers/runc/runc-docker/0002-Remove-Platform-as-no-longer-in-OCI-spec.patch
 create mode 100644 recipes-containers/runc/runc-docker/0003-Update-memory-specs-to-use-int64-not-uint64.patch
 delete mode 100644 recipes-networking/openvswitch/files/configure-Only-link-against-libpcap-on-FreeBSD.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0001-Python3-compatibility-Convert-print-statements.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0002-Python3-compatibility-exception-cleanup.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0003-Python3-compatibility-execfile-to-exec.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0004-Python3-compatibility-iteritems-to-items.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0005-Python3-compatibility-fix-integer-problems.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0006-Python3-compatibility-math-error-compatibility.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0007-Python3-compatibility-unicode-to-str.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0008-AUTHORS-Add-Jason-Wessel.patch
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
 delete mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-c298ef781c2d35d939fe163cbc2f41ea7b1cb8d1.patch

-- 
2.4.0.53.g8440f74


