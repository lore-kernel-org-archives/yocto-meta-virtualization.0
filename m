Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C98E7E0094C; Mon, 19 Jun 2017 08:15:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70F7BE0048B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Jun 2017 08:15:32 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5JFFVv4022660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 19 Jun 2017 08:15:31 -0700
Received: from yow-masselst-lx1.localnet (128.224.60.199) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Mon, 19 Jun 2017 08:15:31 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Pieter Cardoen <pieter.cardoen@hotmail.com>
Date: Mon, 19 Jun 2017 11:15:30 -0400
Message-ID: <4600681.RpVUJuJQMF@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.10.0-22-generic; KDE/5.31.0; x86_64; ; )
In-Reply-To: <DB5PR08MB0774D48A10151464EAFE3AB48EC10@DB5PR08MB0774.eurprd08.prod.outlook.com>
References: <DB5PR08MB07748AB759E39713C30CC2098ECD0@DB5PR08MB0774.eurprd08.prod.outlook.com>
	<CAPuovE+1ihfaXhXpv9C3Koa7W1OPQXy=L7C+QuzAU_rZq4wp+Q@mail.gmail.com>
	<DB5PR08MB0774D48A10151464EAFE3AB48EC10@DB5PR08MB0774.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: /usr/bin/docker: No such file or directory
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
X-List-Received-Date: Mon, 19 Jun 2017 15:15:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, June 16, 2017 7:19:43 AM EDT Pieter Cardoen wrote:
> Dear Mark
> 
> I've checked this and came to the conclusion that  /lib/ld-linux.so.3 is not
> available. Instead it is called /lib/ld-linux-armhf.so.3. If I add a
> symlink with name /lib/ld-linux.so.3 and which points to
> /lib/ld-linux-armhf.so.3, it works.
> 
> Now I still have to adapt the recipes to have this automatically OK. How
> could I tackle this?

Hi Pieter,

Unfortunately I haven't had any time to look at this and only have x86_64 
builds to poke around at. You should start by looking at the package build and 
see where it is getting crossed up. If I do find some time to look at this I 
will let you know what I find.

Mark

> 
> Thanks
> Pieter
> 
> <pieter.cardoen@hotmail.com> wrote:
> > Dear
> > 
> > I am building docker using Yocto for a Xilinx Zynq platform. When I try to
> > start docker, I get:
> > 
> > -sh: /usr/bin/docker: No such file or directory
> > 
> > However this file is available:
> > 
> > ll /usr/bin/docker
> > -rwxr-xr-x    1 root     root      11661808 Jun  9 14:27 docker
> > 
> > What could be the reason of this & how could I debug this?
> 
> Run the 'file' command on the file, my guess it won't match
> executables that do run.
> 
> Mark
> 
> > PS.
> > 
> > I have checked the kernel config using check-config.sh and all Generally
> > Necessary things are OK. Generally Necessary:
> > - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
> > - CONFIG_NAMESPACES: enabled
> > - CONFIG_NET_NS: enabled
> > - CONFIG_PID_NS: enabled
> > - CONFIG_IPC_NS: enabled
> > - CONFIG_UTS_NS: enabled
> > - CONFIG_DEVPTS_MULTIPLE_INSTANCES: enabled
> > - CONFIG_CGROUPS: enabled
> > - CONFIG_CGROUP_CPUACCT: enabled
> > - CONFIG_CGROUP_DEVICE: enabled
> > - CONFIG_CGROUP_FREEZER: enabled
> > - CONFIG_CGROUP_SCHED: enabled
> > - CONFIG_CPUSETS: enabled
> > - CONFIG_MEMCG: enabled
> > - CONFIG_KEYS: enabled
> > - CONFIG_VETH: enabled
> > - CONFIG_BRIDGE: enabled
> > - CONFIG_BRIDGE_NETFILTER: enabled
> > - CONFIG_NF_NAT_IPV4: enabled
> > - CONFIG_IP_NF_FILTER: enabled
> > - CONFIG_IP_NF_TARGET_MASQUERADE: enabled
> > - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled
> > - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled
> > - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled
> > - CONFIG_NF_NAT: enabled
> > - CONFIG_NF_NAT_NEEDED: enabled
> > - CONFIG_POSIX_MQUEUE: enabled
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization



