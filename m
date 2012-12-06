Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA3D4E003D9
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:45 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2862174eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=ccEBXQNPNCoF8c7VSK5a90rwNymCWDULcmWiJldnaeU=;
	b=uQKJgL0sYgUWL2G/U8fNjfPJtEE+UMyXOOtzCJLvOigTZXvn8KOb3y/LzucOqUfAEn
	uTh4anF1+F1UewM2gaeCUQLsw1r4hgo7AkGEHnoVWDSaRm1mlk1v+FdK9HVBq0A3FW+7
	42ZkHN/kHRS1S9kQeDbZSA43y1OgoaNv+LQRENps4yq6zS/8ddjbT9tCvfgnftCdcTZ+
	DpEBwyyr+F8eOkPQbHh9HFMZC2zQJAANxRhkklh0POGiCZ5QbLcvHQFOGq8E1OnkngoE
	wH1Y6KtNiqbg/PlhLw10qIR8al/93N0Y+KcWVp5MQ81061O+L8mGUBAcFMp3jWBJQpDN
	yUyg==
Received: by 10.14.205.198 with SMTP id j46mr7566949eeo.27.1354813605136;
	Thu, 06 Dec 2012 09:06:45 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id z8sm16968649eeo.11.2012.12.06.09.06.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:42 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 15715400CD7; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:21 +0100
Message-Id: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv4 00/15] meta-cloud merge, updated with review comments
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

PATCHv4 updated with review comments.

David Nyström (15):
  Added protobuf-c criu dependency
  Added protobuf criu dependency
  Added CRIU recipe
  Added netcf recipe, libvirt dependency
  Added openbsd-netcat recipe, libvirt dependency
  Added openflow recipe
  Added openvswitch recipe
  Added .gitignore file
  Changed David Nyströms email in README
  Added template cloud-* images
  Added some details in README, and made the description common
  Added kernel configuration for LxC and in kernel OpenvSwitch
  Updated libvirt to 1.0.0, added more details to packageconfig
  Removed old version of libvirt
  Added LxC recipe from meta-fsl-ppc, curtesy of Matthew McClintock,
    Stuart Yoder

 .gitignore                                         |    6 +
 README                                             |   13 +-
 recipes-containers/criu/criu_git.bb                |   29 +++
 .../criu/files/0001-Fixed-hardcoding.patch         |   47 ++++
 recipes-containers/criu/files/disable_tests.patch  |   19 ++
 recipes-containers/criu/protobuf-c_0.15.bb         |   20 ++
 recipes-containers/criu/protobuf_2.4.1.bb          |   18 ++
 recipes-containers/lxc/files/noldconfig.patch      |   29 +++
 recipes-containers/lxc/lxc_0.8.0.bb                |   39 +++
 recipes-extended/images/cloud-image-compute.bb     |   14 +
 recipes-extended/images/cloud-image-controller.bb  |   34 +++
 recipes-extended/images/cloud-image-guest.bb       |   18 ++
 .../{libvirt_0.10.2.bb => libvirt_1.0.0.bb}        |   69 +++--
 recipes-kernel/linux/linux-yocto/lxc.cfg           |   22 ++
 recipes-kernel/linux/linux-yocto/lxc.scc           |    4 +
 recipes-kernel/linux/linux-yocto/vswitch.cfg       |    2 +
 recipes-kernel/linux/linux-yocto/vswitch.scc       |    4 +
 recipes-kernel/linux/linux-yocto_3.4.bbappend      |    5 +-
 recipes-networking/netcat/openbsd-netcat_1.6.bb    |   29 +++
 recipes-networking/netcf/netcf_git.bb              |   25 ++
 recipes-networking/openflow/openflow_1.0.bb        |   24 ++
 .../openvswitch/files/openvswitch-controller       |  274 ++++++++++++++++++++
 .../openvswitch/files/openvswitch-controller-setup |   29 +++
 .../openvswitch/files/openvswitch-example          |  102 ++++++++
 .../openvswitch/files/openvswitch-switch           |  102 ++++++++
 .../openvswitch/files/openvswitch-switch-setup     |    8 +
 .../openvswitch/openvswitch_1.4.3.bb               |   99 +++++++
 27 files changed, 1053 insertions(+), 31 deletions(-)
 create mode 100644 .gitignore
 create mode 100644 recipes-containers/criu/criu_git.bb
 create mode 100644 recipes-containers/criu/files/0001-Fixed-hardcoding.patch
 create mode 100644 recipes-containers/criu/files/disable_tests.patch
 create mode 100644 recipes-containers/criu/protobuf-c_0.15.bb
 create mode 100644 recipes-containers/criu/protobuf_2.4.1.bb
 create mode 100644 recipes-containers/lxc/files/noldconfig.patch
 create mode 100644 recipes-containers/lxc/lxc_0.8.0.bb
 create mode 100644 recipes-extended/images/cloud-image-compute.bb
 create mode 100644 recipes-extended/images/cloud-image-controller.bb
 create mode 100644 recipes-extended/images/cloud-image-guest.bb
 rename recipes-extended/libvirt/{libvirt_0.10.2.bb => libvirt_1.0.0.bb} (61%)
 create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc
 create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.scc
 create mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb
 create mode 100644 recipes-networking/netcf/netcf_git.bb
 create mode 100644 recipes-networking/openflow/openflow_1.0.bb
 create mode 100755 recipes-networking/openvswitch/files/openvswitch-controller
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-controller-setup
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-example
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-switch
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-switch-setup
 create mode 100644 recipes-networking/openvswitch/openvswitch_1.4.3.bb

-- 
1.7.9.5


