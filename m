Return-Path: <josep.puigdemont@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 7D4DCE004F1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 03:33:13 -0800 (PST)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 27 Feb 2014 12:33:10 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3836)	id 014CE2880FA;
	Thu, 27 Feb 2014 12:33:10 +0100 (CET)
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 27 Feb 2014 12:33:05 +0100
Message-ID: <1393500786-16877-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] Update lxc recipe to 1.0.0
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
X-List-Received-Date: Thu, 27 Feb 2014 11:33:15 -0000
Content-Type: text/plain

LXC 1.0 was released last week [1], this is an update of the lxc recipe to use
the latest stable version.
There are not many changes from the 0.9.0 recipe, just the hashes and the fetch
url. Some patches have been removed since they have already been included
in lxc-1.0.0.

[1] https://lists.linuxcontainers.org/pipermail/lxc-users/2014-February/006260.html

Josep Puigdemont (1):
  Update Linux Containers to lxc-1.0.0

 .../lxc-0.9.0-always-strdup-rootfs-mount.patch     |   27 --------
 ...xc-0.9.0-check-when-bind-mounting-libdirs.patch |   44 ------------
 .../lxc-0.9.0-configure-allow-subdir-objects.patch |   35 ----------
 ...0.9.0-disable-udhcp-from-busybox-template.patch |   24 -------
 ...c-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch |   29 --------
 ...-chpasswd-functionality-for-busybox-hosts.patch |   70 --------------------
 ...tdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch |   49 --------------
 .../files/lxc-0.9.0-use-susv3-head-arguments.patch |   46 -------------
 ...1.0.0-disable-udhcp-from-busybox-template.patch |   24 +++++++
 recipes-containers/lxc/lxc_0.9.0.bb                |   69 -------------------
 recipes-containers/lxc/lxc_1.0.0.bb                |   62 +++++++++++++++++
 11 files changed, 86 insertions(+), 393 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-configure-allow-subdir-objects.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
 create mode 100644 recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
 delete mode 100644 recipes-containers/lxc/lxc_0.9.0.bb
 create mode 100644 recipes-containers/lxc/lxc_1.0.0.bb

-- 
1.7.10.4


