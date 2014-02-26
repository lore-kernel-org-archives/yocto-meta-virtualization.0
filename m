Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 55FBFE00736
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 02:08:11 -0800 (PST)
Received: from sestows930 (172.16.140.35) by smtp.enea.com (172.21.1.208) with
	Microsoft SMTP Server id 14.3.158.1; Wed, 26 Feb 2014 11:08:06 +0100
Received: from jori by sestows930 with local (Exim 4.80)	(envelope-from
	<jori@sestows930>)	id 1WIbPK-0004YD-8z; Wed, 26 Feb 2014 11:08:06 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Feb 2014 11:07:52 +0100
Message-ID: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 0/5] libvirt fixes and a kernel update
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
X-List-Received-Date: Wed, 26 Feb 2014 10:08:13 -0000
Content-Type: text/plain

Hi,

The ultimate goal of this patch series was to use a DISTRO_FEATURE to include
the lxc.scc configuration in the kernel to be built. This is done to avoid that
the kernel configuration gets additional code paths ( =y options ) when adding
the meta-virtualization layer. The configurations that enables modules are left
untouched.

In this process, I stumbled upon some bugs/issues with the libvirt recipe,
which are updated as well.

Best regards,
/Jonas

Jonas Eriksson (5):
  libvirt: Change license to LGPLv2.1+
  libvirt: Fix selinux DISTRO_FEATURE check
  Use a DISTRO_FEATURE to toggle LXC support
  libvirt: Use DISTRO_FEATURES to enable Xen support
  libvirt: Disable polkit driver when there is no x11

 recipes-extended/libvirt/libvirt_1.2.1.bb      | 14 +++++++++-----
 recipes-kernel/linux/linux-yocto_3.10.bbappend |  4 +++-
 recipes-kernel/linux/linux-yocto_3.4.bbappend  |  4 +++-
 recipes-kernel/linux/linux-yocto_3.8.bbappend  |  4 +++-
 4 files changed, 18 insertions(+), 8 deletions(-)

-- 
1.9.rc1


