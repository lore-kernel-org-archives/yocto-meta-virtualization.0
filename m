Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC51CE00460; Thu, 23 Aug 2018 05:17:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 107FEE003C1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Aug 2018 05:17:52 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id r4-v6so3884739lff.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Aug 2018 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+PCUCC8MxiCqhN6aWaHyZBKM0mWtWpHs8bdgZaBBGts=;
	b=YQsdJsiRVhGcGsoWHbChUDTODXeEiTRh1XRmHv7YhAu3p7hrzGlX0K7GYC1xYOYVc+
	clFAOvzMt2CSqJbM2CCZXS2JheGWmXoWOt9vaI63axhyTjII9XMD3CcA3xgBJEXavBb3
	sHJKLkeskFvsGajjaeoK2tVftdm2TsAseAlT0dWWka/DTIx6h8mLQhb0i9A8jMXv1hFE
	08/u8fTWFEQbGfYhDvQXmNeWTRPtCX+LVQCf/6aw9sX7IE+veEjlVIS6ulnbLkySamiU
	XPiwlsxAILhJLyRxn8UpeKW5Pz6ogceYpujZaRQHbLEsb11AZn+Zew9u8qifp6nT3ZIU
	NGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+PCUCC8MxiCqhN6aWaHyZBKM0mWtWpHs8bdgZaBBGts=;
	b=Zb2YS7TqRqnlyjaKusr1Vxhz44gxO8t4vEidUdMB+1hALIcnsZoUwGqsqe6vb6Nh4Z
	KUhR7FyvA1NIkqtH93oJILPMWi8196u8PF1UX3lEYzj9+s2U3H2oNfoz1VrcELRdlMWA
	rhodYlRgiFRfB6GCn968l5cXiNKCF02++UB5jFIyMTkg1vMSw6D+dI+o3B5csP11UixD
	xJ+JsngHuvp2I91lxbDC2Mpa089Yz3Lle7yNPJ+IoQG946q89WM4QK9kO2X08xQPGY/i
	fg7RF/CSv8k4Tv0UNTtvI1fYRcDbqhRiuEc9uHCYIDU9zBI3Kk+kgXi9amyRpY/KYUGr
	tT6g==
X-Gm-Message-State: AOUpUlFwvCfpdxJlmxMFeW/Z+3YgKQWO63qjT1ZgcfnpxMjElj6VJmJr
	4qWfCwWQkuGH7PehkoZDjKoZmRjQ45+cKoCchlY=
X-Google-Smtp-Source: AA+uWPzcA3VjXwcFaEHwUvz57jEiBa4S+qoRZCWQS148NqZdsJOXMSmYMDFEbsyvd12E4o/umB62jYwoypgx/IdaHUs=
X-Received: by 2002:a19:5c57:: with SMTP id
	q84-v6mr14031623lfb.51.1535026671856; 
	Thu, 23 Aug 2018 05:17:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 05:17:51
	-0700 (PDT)
In-Reply-To: <128A9675-00C5-43FA-9C47-D37E1E4E2447@soton.ac.uk>
References: <128A9675-00C5-43FA-9C47-D37E1E4E2447@soton.ac.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Aug 2018 08:17:51 -0400
Message-ID: <CADkTA4PJHdv0VFf6E+VV9eG7PVLQaZSOqGC3ukvf_5vPFZsR5A@mail.gmail.com>
To: "Apetroaie-Cristea M." <mac1g12@soton.ac.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Docker daemon not starting on Raspberry Pi 3
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
X-List-Received-Date: Thu, 23 Aug 2018 12:17:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 21, 2018 at 12:49 PM, Apetroaie-Cristea M.
<mac1g12@soton.ac.uk> wrote:
> Hello,
>
> I am trying to build a docker enabled image for Raspberry pi using the
> meta-virtualization layer, sumo branch. The image builds, but when I try to
> run docker on the pi I get the following error:
>
> Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the
> docker daemon running?
>
>
> When running $dockerd, I get the following errors:
>
> root@raspberrypi3:~# dockerd
> INFO[2018-08-21T16:42:43.735133756Z] libcontainerd: started new
> docker-containerd process  pid=1281
> INFO[0000] starting containerd                           module=containerd
> revision=cfd04396dc68220d1cecbe686a6cc3aa5ce3667c.m version=v1.0.2.m
> INFO[0000] loading plugin "io.containerd.content.v1.content"...
> module=containerd type=io.containerd.content.v1
> INFO[0000] loading plugin "io.containerd.snapshotter.v1.overlayfs"...
> module=containerd type=io.containerd.snapshotter.v1
> INFO[0000] loading plugin "io.containerd.metadata.v1.bolt"...
> module=containerd type=io.containerd.metadata.v1
> INFO[0000] loading plugin "io.containerd.differ.v1.walking"...
> module=containerd type=io.containerd.differ.v1
> INFO[0000] loading plugin "io.containerd.gc.v1.scheduler"...
> module=containerd type=io.containerd.gc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.containers"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.content"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.diff"...  module=containerd
> type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.events"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.healthcheck"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.images"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.leases"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.namespaces"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.snapshots"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.monitor.v1.cgroups"...
> module=containerd type=io.containerd.monitor.v1
> INFO[0000] loading plugin "io.containerd.runtime.v1.linux"...
> module=containerd type=io.containerd.runtime.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.tasks"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.version"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] loading plugin "io.containerd.grpc.v1.introspection"...
> module=containerd type=io.containerd.grpc.v1
> INFO[0000] serving...
> address="/var/run/docker/containerd/docker-containerd-debug.sock"
> module="containerd/debug"
> INFO[0000] serving...
> address="/var/run/docker/containerd/docker-containerd.sock"
> module="containerd/grpc"
> INFO[0000] containerd successfully booted in 0.023991s   module=containerd
> ERRO[2018-08-21T16:42:43.989165300Z] Failed to built-in GetDriver graph
> btrfs /var/lib/docker
> ERRO[2018-08-21T16:42:44.002937386Z] 'overlay' not found as a supported
> filesystem on this host. Please ensure kernel is new enough and has overlay
> support loaded.
> ERRO[2018-08-21T16:42:44.025624033Z] 'overlay' not found as a supported
> filesystem on this host. Please ensure kernel is new enough and has overlay
> support loaded.
> ERRO[2018-08-21T16:42:44.026525661Z] Failed to built-in GetDriver graph
> devicemapper /var/lib/docker
> INFO[2018-08-21T16:42:44.054916094Z] Graph migration to
> content-addressability took 0.00 seconds
> WARN[2018-08-21T16:42:44.056984615Z] Your kernel does not support cgroup
> memory limit
> WARN[2018-08-21T16:42:44.057659885Z] Your kernel does not support cgroup cfs
> period
> WARN[2018-08-21T16:42:44.058345781Z] Your kernel does not support cgroup cfs
> quotas
> WARN[2018-08-21T16:42:44.058842247Z] Your kernel does not support cgroup rt
> period
> WARN[2018-08-21T16:42:44.059354130Z] Your kernel does not support cgroup rt
> runtime
> WARN[2018-08-21T16:42:44.060948686Z] mountpoint for pids not found
> INFO[2018-08-21T16:42:44.064498271Z] Loading containers: start.
> WARN[2018-08-21T16:42:44.077446385Z] Running modprobe bridge br_netfilter
> failed with message: modprobe: WARNING: Module br_netfilter not found in
> directory /lib/modules/4.14.39
> , error: exit status 1
> WARN[2018-08-21T16:42:44.570023626Z] Could not load necessary modules for
> Conntrack: Running modprobe nf_conntrack_netlink failed with message:
> `modprobe: WARNING: Module nf_conntrack_netlink not found in directory
> /lib/modules/4.14.39`, error: exit status 1
> INFO[2018-08-21T16:42:44.571706412Z] Default bridge (docker0) is assigned
> with an IP address 172.17.0.0/16. Daemon option --bip can be used to set a
> preferred IP address
> Error starting daemon: Error initializing network controller: Error creating
> default "bridge" network: Failed to program NAT chain: Failed to inject
> DOCKER in PREROUTING chain: iptables failed: iptables --wait -t nat -A
> PREROUTING -m addrtype --dst-type LOCAL -j DOCKER: iptables: No
> chain/target/match by that name.

From that output, your kernel isn't configured properly to support the
daemon. If you aren't using a linux-yocto variant, you'll need to make
sure it is properly configured in your own defconfig (or whatever you
use).

If you are using something that inherits linux-yocto fragment support,
you can use the docker fragment in the meta-virt layer to add the
configs you need.

Bruce

>  (exit status 1)
>
>
> Does anyone know how to solve this problem? Thank you!
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

