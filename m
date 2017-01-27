Return-Path: <kevron.m.rees@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1102FE00510; Fri, 27 Jan 2017 14:27:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.45 listed in list.dnswl.org]
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C10B3E004A0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jan 2017 14:27:34 -0800 (PST)
Received: by mail-oi0-f45.google.com with SMTP id w204so165574478oiw.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Jan 2017 14:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=hjd4HNexoJDPwAilojday2Wk2GKc0z7EP0IjyOjq8jU=;
	b=FlO068nahe00wMkhhd3DjT8Cz4/64QOB4oRsck2Z2JPS0BSxy3MkO6dU7evWxvle/2
	AXg8Qe483f7aNAAO5Xz2sSHOY7dgjjv5aqy73qU2c+Qegz/xclib+Vy76lhSBziO+4MY
	/IS3E767JAMowanfM2rrnA8XSm3C2TXQh+KG9HlUZvz8IIKbQ2gGNYjYgtA6IzYTm6bu
	YXHGJGYmlUQenmC4m13Q+npxRQD/7sfVZ2l3FZ37Dn7tViWBlpW74EzG5X4utsuQlS2L
	GuI+BULqenM7F8PYH7Eb2XV9Sh43TTGZqgQia2e1HqNu0MBQwZHek/Qn+rSm9n7ZohuQ
	ez6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=hjd4HNexoJDPwAilojday2Wk2GKc0z7EP0IjyOjq8jU=;
	b=Y4A6XEs4mlXhcPmlDSNueTzt23xlh0RE/6O89ySnJ9cQbGZZ4+vLKuCYqqT4ypPK47
	/bYYdzLtBWvwBb9asBAftg+xaj3S6KU3siqLc39e7q9v9JF9VfAhBDhYBDWJUrplpBud
	M0SKotlsbqVGl2vb8qJrqtgRon0ykp1LmOnPQzDir4MWxXuqV+HpnmthN6ytAHUKyvrk
	w50h1n6t0MQt3uUoyIqX3e6D4Z5lZfjdH5aR/JjqJqBK1Pl4C34hUHqMKUKojiFI99XD
	0KvQpUGgg7LXIjyzg2tzu9xkBh1L3kBfzoDrP060ERdl76FSsm9GwhSOPPC1RidN6ajm
	fjxw==
X-Gm-Message-State: AIkVDXLdj8zjdpsBfx3smsBZbrsV7+R62ub1TpDJj4g7diYHyGkr9TgbPgiYNqpc6B7TFlnqZpz+3JvkXMOolaYc
X-Received: by 10.202.105.71 with SMTP id e68mr6142635oic.119.1485556054344;
	Fri, 27 Jan 2017 14:27:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.39.199 with HTTP; Fri, 27 Jan 2017 14:27:33 -0800 (PST)
In-Reply-To: <CAFW5wYbS2P61xOMy0rpOJzYXwPfXdLBO=CUdLG6D_GfT51dd6Q@mail.gmail.com>
References: <CAFW5wYbS2P61xOMy0rpOJzYXwPfXdLBO=CUdLG6D_GfT51dd6Q@mail.gmail.com>
From: "Rees, Kevron" <kevron.m.rees@intel.com>
Date: Fri, 27 Jan 2017 14:27:33 -0800
Message-ID: <CAFW5wYYwuXADEaE+y7APnNL7HsZmuVWVz8S4=p6pi2OnmbudRA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: using lxc-create in yocto environment
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
X-List-Received-Date: Fri, 27 Jan 2017 22:27:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 27, 2017 at 8:36 AM, Rees, Kevron <kevron.m.rees@intel.com> wrote:
> I'm trying to call "lxc-create" to create an unprivileged container
> within the yocto environment.  I am using a config file containing
> uid/gid mappings that seems to work on my host system:
>
> lxc.include = /etc/lxc/default.conf
> lxc.id_map = u 0 100000 65536
> lxc.id_map = g 0 100000 65536
>
> The command I'm using in my bitbake recipe is as follows:
>
> lxc-create -l DEBUG -o muhlog.lob \
>               --config=${S}/default.conf --lxcpath=${S}/var/lib/lxc \
>               -t download --name=safety -- -d ubuntu -r xenial -a amd64 \
>               --no-validate
>
> "${S}" points to my working directory that has default.conf in it.
>
> The output is as follows:
>
> | DEBUG: Executing shell function do_compile
> | newuidmap: write to uid_map failed: Operation not permitted

The problem seems to be here.  It's trying to use newuidmap from
sysroot.  If I force it to use the host's newuidmap from
/usr/bin/newuidmap, it works.  One of the issues could be that the
setuid flag on the yocto environment's newuidmap seems missing.  I
wonder why the version in sysroot doesn't work...

> | error mapping child
> | setgid: Invalid argument
> | lxc-create: safety: lxccontainer.c: do_create_container_dir: 985
> Failed to chown container dir
> | lxc-create: safety: tools/lxc_create.c: main: 318 Error creating
> container safety
>
> The "error mapping child" error comes from
> src/lxc/tools/lxc_usernsexec.c:370 when calling lxc_map_ids().
>
> Any hints on why newuidmap would fail?  I'm hoping that's the root
> issue here and the subsequent messages are just the result.
>
> cheers,
> -Kevron

