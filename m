Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 449E9E006D8; Thu,  9 Feb 2017 06:52:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.45 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.45 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FC05E006D8
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 06:52:11 -0800 (PST)
Received: by mail-wm0-f45.google.com with SMTP id r141so21635460wmg.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Feb 2017 06:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GzSPPaPxvF143oZkQd1wL2yU6sBbqvNIUQ+hLcIsPMk=;
	b=GJnvhWFvI8CHGgGbWc9gBdKEgGFr1O5YsN2fAIY/DUGys3CNhLq4PEtv75yq/s0zJJ
	sOivYIrv+JPCFbajq6Lxk2dHMo5PPft4rljw9uoXjquxCN6gB4vq0CZpDq9tR/7/zS2u
	rtEfhMdCxCJywmegg9FNK5F6N00ee73GR6y4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GzSPPaPxvF143oZkQd1wL2yU6sBbqvNIUQ+hLcIsPMk=;
	b=QEi/29vq0FlvwTaSyQZlsjHHFFmA7jWd3VA7WTBKnDDoL8NnYErD/VNJoQgsIBX2L0
	Jx2w4A4n2e/XSlV1ybwHJpcicwG+oM91U4gg7BCCMmomM84JLBRkrmXrQag/+u5ku/Yh
	BllYfArW5zJTK4jT3k9H02Hi4Xl5zfEoKH5/gZKNb8CxVW3HzDrgMdu23oo/vBm9mu8B
	EN5O3cnbMPt0MxEiGi2aFumtHApmnrhZzcyYh1b34bhI6ham4LEJnegAgHhAyUICeXyI
	8Q1j2BCM7xGYi90wSp5tadJyp5Q6boBGm+F/AJHWYnMrV/EqRSgLIJkBLkmti4Zf9FP2
	sv/g==
X-Gm-Message-State: AMke39l25ZfCPVEnow5TQ0uVIpqjUmhMZ0G1D09X1GGls6Xg26uKXORFQVagZEYdrJ8NSXwiAS/Z0l0MUsQ/Ld0Z
X-Received: by 10.28.221.7 with SMTP id u7mr21698495wmg.33.1486651930702; Thu,
	09 Feb 2017 06:52:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.89 with HTTP; Thu, 9 Feb 2017 06:52:10 -0800 (PST)
In-Reply-To: <1269f062-84ce-cce9-b242-73853573593f@windriver.com>
References: <20170209072501.19696-1-fathi.boudra@linaro.org>
	<1269f062-84ce-cce9-b242-73853573593f@windriver.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 9 Feb 2017 16:52:10 +0200
Message-ID: <CAGNsrLDKAe9SXyBanU2zSvABho3Wa5KoNhecJ6UGicYLginvMw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: meta-virtualization@yoctoproject.org, Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH] docker: downgrade lxc/docker-registry/rt-tests to suggests
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
X-List-Received-Date: Thu, 09 Feb 2017 14:52:13 -0000
Content-Type: text/plain; charset=UTF-8

On 9 February 2017 at 15:56, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2017-02-09 02:25 AM, Fathi Boudra wrote:
>>
>> Regular users don't need lxc, docker-registry and rt-tests on the target.
>> These tools aren't even needed or provide additional features when running
>> docker at runtime. They also increase the size of the image uneccessarily.
>
>
> They can also just inhibit the installation of rrecommends (which is
> what I do).
>
> But yes, I'm ok with making sure that these aren't slipping into more
> builds than necessary.

yes, that's what I thought too but I think it's worth fixing to avoid
everybody using docker to fallback using BAD_RECOMMENDATIONS,
NO_RECOMMENDATIONS or PACKAGE_EXCLUDE.

> Bruce
>
>
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  recipes-containers/docker/docker_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/docker/docker_git.bb
>> b/recipes-containers/docker/docker_git.bb
>> index c208a02..81fd4d4 100644
>> --- a/recipes-containers/docker/docker_git.bb
>> +++ b/recipes-containers/docker/docker_git.bb
>> @@ -61,8 +61,8 @@ RDEPENDS_${PN} = "curl aufs-util git util-linux iptables
>> \
>>
>> ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
>>                   "
>>  RDEPENDS_${PN} += "containerd runc"
>> -RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
>> -RRECOMMENDS_${PN} += " kernel-module-dm-thin-pool kernel-module-nf-nat"
>> +RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
>> +RSUGGESTS_${PN} = "lxc docker-registry rt-tests"
>>  DOCKER_PKG="github.com/docker/docker"
>>
>>  do_configure[noexec] = "1"
>>

