Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 734EAE0144E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:12 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4029691eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=e8gmF2h151acCLDQH0eK+bcZR0XwPM0aioRmwjRg2xg=;
	b=afRaXZUyz5Le47JHC9d8TvXmMV9QdmG4ANIi2POy62U5V9zFsKeuh0RX76+iHx7Ir5
	excHksYkF1S9eu6jsbLAVdc7C8eAk1/CvPIPhQPFCMnjSushi1fBqJcHhOSWIVyn4exX
	sqtJr/tHJStPb+sfD67++Y/VcACl5ZK5Lk52uR9djZY9+FEv3+23iX80E3p/snhnQbfw
	y+Cc4l2TFSdxfBPGSicrB0038P96vKa/lvJE+KhdihMcbnqpTcHDRrCwEmtnEcIoy9On
	LGEjQjZ83TGbRXXGHxyXTWjV8F62PSOP2YVwv8cpbp5IH960YKjlrV2AzJTwTtIoiHB0
	jZ9A==
Received: by 10.14.203.8 with SMTP id e8mr6127759eeo.2.1354801511673;
	Thu, 06 Dec 2012 05:45:11 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id y44sm15983191eel.14.2012.12.06.05.45.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:09 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id BA68D400CD1; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:32 +0100
Message-Id: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/14] Adding content of meta-cloud
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

Since there are some common parts, please review,
specifically the libvirt changes.

David Nyström (14):
  Added protobuf-c criu dependency
  Added protobuf criu dependency
  Added CRIU recipe
  Added lxc recipe
  Added netcf recipe, libvirt dependency
  Added openbsd-netcat recipe, libvirt dependency
  Added openflow recipe
  Added openvswitch recipe
  Added .gitignore file
  Changed David Nyströms email in README
  Added template cloud-* images
  Added some details in README, and made the description common
  Upgraded to libvirt 1.0.0, and added a more detailed packageconfig
  Added kernel configuration for LxC and in kernel OpenvSwitch

 .gitignore                                         |    6 +
 README                                             |   13 +-
 recipes-containers/criu/criu_git.bb                |   29 +++
 .../criu/files/0001-Fixed-hardcoding.patch         |   47 ++++
 recipes-containers/criu/files/disable_tests.patch  |   19 ++
 recipes-containers/criu/protobuf-c_0.15.bb         |   20 ++
 recipes-containers/criu/protobuf_2.4.1.bb          |   18 ++
 recipes-containers/lxc/files/libmounts.patch       |   48 ++++
 recipes-containers/lxc/files/noldconfig.patch      |   29 +++
 recipes-containers/lxc/lxc_0.8.0.bb                |   39 +++
 recipes-extended/images/cloud-image-compute.bb     |   14 +
 recipes-extended/images/cloud-image-controller.bb  |   34 +++
 recipes-extended/images/cloud-image-guest.bb       |   18 ++
 recipes-extended/libvirt/libvirt_1.0.0.bb          |  139 ++++++++++
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
 28 files changed, 1194 insertions(+), 8 deletions(-)
 create mode 100644 .gitignore
 create mode 100644 recipes-containers/criu/criu_git.bb
 create mode 100644 recipes-containers/criu/files/0001-Fixed-hardcoding.patch
 create mode 100644 recipes-containers/criu/files/disable_tests.patch
 create mode 100644 recipes-containers/criu/protobuf-c_0.15.bb
 create mode 100644 recipes-containers/criu/protobuf_2.4.1.bb
 create mode 100644 recipes-containers/lxc/files/libmounts.patch
 create mode 100644 recipes-containers/lxc/files/noldconfig.patch
 create mode 100644 recipes-containers/lxc/lxc_0.8.0.bb
 create mode 100644 recipes-extended/images/cloud-image-compute.bb
 create mode 100644 recipes-extended/images/cloud-image-controller.bb
 create mode 100644 recipes-extended/images/cloud-image-guest.bb
 create mode 100644 recipes-extended/libvirt/libvirt_1.0.0.bb
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


