Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 7BEFFE01445
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2013 01:28:50 -0700 (PDT)
Received: from [172.16.141.168] (172.16.141.168) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Tue, 3 Sep 2013
	10:28:48 +0200
Message-ID: <52259DB3.3030302@enea.com>
Date: Tue, 3 Sep 2013 10:28:35 +0200
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1378169690-4438-1-git-send-email-cjp256@gmail.com>
In-Reply-To: <1378169690-4438-1-git-send-email-cjp256@gmail.com>
X-Originating-IP: [172.16.141.168]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] busybox: migrate from defconfig to config fragments.
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
X-List-Received-Date: Tue, 03 Sep 2013 08:28:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2013 02:54 AM, Chris Patterson wrote:
> ---
>   recipes-core/busybox/busybox/lspci.cfg        |    1 +
>   recipes-core/busybox/busybox/lsusb.cfg        |    1 +
>   recipes-core/busybox/busybox/mdev.cfg         |    6 +
>   recipes-core/busybox/busybox/mount-cifs.cfg   |    1 +
>   recipes-core/busybox/busybox/ps-extras.cfg    |    3 +
>   recipes-core/busybox/busybox_1.21.1.bbappend  |    9 +-
>   recipes-core/busybox/busybox_1.21.1/defconfig | 1009 -------------------------
>   7 files changed, 20 insertions(+), 1010 deletions(-)
>   create mode 100644 recipes-core/busybox/busybox/lspci.cfg
>   create mode 100644 recipes-core/busybox/busybox/lsusb.cfg
>   create mode 100644 recipes-core/busybox/busybox/mdev.cfg
>   create mode 100644 recipes-core/busybox/busybox/mount-cifs.cfg
>   create mode 100644 recipes-core/busybox/busybox/ps-extras.cfg
>   delete mode 100644 recipes-core/busybox/busybox_1.21.1/defconfig
>

+1 on this, nice work b.t.w. its long overdue to have done this.

//DD


