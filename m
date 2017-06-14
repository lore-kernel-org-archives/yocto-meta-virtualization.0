Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FB96E00B8F; Wed, 14 Jun 2017 13:36:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD3E8E00B77
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Jun 2017 13:36:09 -0700 (PDT)
Received: by mail-yw0-f176.google.com with SMTP id e142so7825742ywa.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Jun 2017 13:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k0AW/d91VXq6TxLyAY8BmIiaDNXai+Nv4a1f2wYgp98=;
	b=sya+TQALTPWm4Mi1Q3datzpRr+QgPSjLc9lyOLrBuynyZdeKSnjRSMl7I2B442DueQ
	MSMd81tyPAEjAdOylMaZD5PpRHCDs20CEJ058ZVKSgNmBbVc9oKKlI5xvDE4tIlUX8av
	FyUwAswnC1+qQrLV4IR4swYF6N5Y+gP7lhO6GopU3CuvOFVmXI1Wt+B7f6OOHTgEHhLH
	ssA8Rkx5RxOVQZC1ZcnFpyBK8ALeGnOLiZi3HbwLcrG5FW5zTuj1WbdLMe98H+Y/0dAs
	ZXkJHjOtuJJtZrcijs/P4gMeYltc/IAZOQtyPfNosp9yvD0Wkl6qTDl7leHuY+ozcxmX
	5eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=k0AW/d91VXq6TxLyAY8BmIiaDNXai+Nv4a1f2wYgp98=;
	b=CneIY60HP4VlAyD1Apl0CR50kcl/mSIQSS7lKtz3TnN4YmkubItMFpdfO8wN2i2gbc
	XBiEzxlsuqlcEuKSqB1tqEfT9//cRppOM25OhZmeLrcoL0YdyiuNi7H/wfuHKAMHbtAU
	p+QWbKJg4RwQTOWFATtozzP8i4NK0b+gkwkScqyiwz/n+vf8pneMjICZliwWHUdOEKAS
	IMEavEWUSFJpO6Li+Hcg34Ee1aTQvgWgNCaF3fMXO6n/5AnMW0HFD/CON496wSG7eOL7
	knkA/ekF6Vj6VxgbsjaGeDFahMgqeu304G5V3vXDp9FdIU4ZoU4zH3LVhTMRWbZ2erU7
	PS6g==
X-Gm-Message-State: AKS2vOzOYEsKqpnM8gzj+sIEGQulsUXEodInW2NN3oBI9IoGhrUZDVo/
	723nyUrdFqhSDtE3pQc0aL7+aqnzDQ==
X-Received: by 10.13.212.133 with SMTP id w127mr1653094ywd.34.1497472568514;
	Wed, 14 Jun 2017 13:36:08 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.17.129 with HTTP; Wed, 14 Jun 2017 13:36:08 -0700 (PDT)
In-Reply-To: <DB5PR08MB07748AB759E39713C30CC2098ECD0@DB5PR08MB0774.eurprd08.prod.outlook.com>
References: <DB5PR08MB07748AB759E39713C30CC2098ECD0@DB5PR08MB0774.eurprd08.prod.outlook.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 14 Jun 2017 16:36:08 -0400
X-Google-Sender-Auth: fzQdZUyaszmd02QZQMufA8Mf4I8
Message-ID: <CAPuovE+1ihfaXhXpv9C3Koa7W1OPQXy=L7C+QuzAU_rZq4wp+Q@mail.gmail.com>
To: Pieter Cardoen <pieter.cardoen@hotmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: /usr/bin/docker: No such file or directory
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Jun 2017 20:36:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 12, 2017 at 8:24 AM, Pieter Cardoen
<pieter.cardoen@hotmail.com> wrote:
> Dear
>
> I am building docker using Yocto for a Xilinx Zynq platform. When I try to start docker, I get:
>
> -sh: /usr/bin/docker: No such file or directory
>
> However this file is available:
>
> ll /usr/bin/docker
> -rwxr-xr-x    1 root     root      11661808 Jun  9 14:27 docker
>
> What could be the reason of this & how could I debug this?

Run the 'file' command on the file, my guess it won't match
executables that do run.

Mark

>
> PS.
>
> I have checked the kernel config using check-config.sh and all Generally Necessary things are OK.
> Generally Necessary:
> - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
> - CONFIG_NAMESPACES: enabled
> - CONFIG_NET_NS: enabled
> - CONFIG_PID_NS: enabled
> - CONFIG_IPC_NS: enabled
> - CONFIG_UTS_NS: enabled
> - CONFIG_DEVPTS_MULTIPLE_INSTANCES: enabled
> - CONFIG_CGROUPS: enabled
> - CONFIG_CGROUP_CPUACCT: enabled
> - CONFIG_CGROUP_DEVICE: enabled
> - CONFIG_CGROUP_FREEZER: enabled
> - CONFIG_CGROUP_SCHED: enabled
> - CONFIG_CPUSETS: enabled
> - CONFIG_MEMCG: enabled
> - CONFIG_KEYS: enabled
> - CONFIG_VETH: enabled
> - CONFIG_BRIDGE: enabled
> - CONFIG_BRIDGE_NETFILTER: enabled
> - CONFIG_NF_NAT_IPV4: enabled
> - CONFIG_IP_NF_FILTER: enabled
> - CONFIG_IP_NF_TARGET_MASQUERADE: enabled
> - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled
> - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled
> - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled
> - CONFIG_NF_NAT: enabled
> - CONFIG_NF_NAT_NEEDED: enabled
> - CONFIG_POSIX_MQUEUE: enabled
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

