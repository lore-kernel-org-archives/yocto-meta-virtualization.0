Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1B7BE00C80; Fri, 23 Mar 2018 07:22:46 -0700 (PDT)
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
	*      [209.85.215.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 381A8E00C75;
	Fri, 23 Mar 2018 07:22:45 -0700 (PDT)
Received: by mail-lf0-f46.google.com with SMTP id y2-v6so18580612lfc.5;
	Fri, 23 Mar 2018 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6vug4s/yCX92Dc5lzAIhEc9ANeG4i9G8N7LUDX4fgXc=;
	b=N5R6QLj0DHGRiY0Ukr1+9TPLsNNWZV6Yo5/booLcg+FlmmWXOs/2TTVP/WG9JSUZ1T
	Y7cEn23bRU2a+U/ju2gU1RiOtU2JraZZyUBfxax8oNMZThVv2ImIwICmUWDquxQoBbQq
	f5EvE/tB5XXwQMIWDvfoPOkCO7bbwDBnfnLUyiAOuX2GBNMn2OiVSgvws4GqI13gLvjX
	7F29j5JhBc5eZSQKNRwtPBmHY2inaY5lTTvYUo2eGfeuAt9G+QQOQIQLDVP9ICaLf5up
	fypzl9beGnX9WWCH/Yp1WENaXSpfqOWFba8yciUVeuzW0z4erkgO5/We3VTUbX4Scqr4
	lrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6vug4s/yCX92Dc5lzAIhEc9ANeG4i9G8N7LUDX4fgXc=;
	b=qIQtA56JlYqWsawaAq0ggrKrdhJePl8drv5gOufAk67DJlb7dXGSkBZ0yBZdZayE7r
	94ykyB+CUqJHi4fph6lb3C0AOTNA38jbZ87qF9zGTnlYgq3x/z3nwUeN0LGQJGan2a98
	oQH4zKwn8Qok1ri0uV9LyMiODQeuOBEjTIx2/Do6tDr96pXKZrAD4NRunnFbnHj903DX
	2erV6yOROdsFn2JJfc63/tzPta+G08+z1u1wD+q/jX6wuJQw0m7eQBgCXleH6tug67q4
	iGpeLwD6y/L3k+xnZVX7ez7Ulr6H1ptT+i99vI4WXVaSCjDkR303V9oOUZl6Km/NvA+p
	uUGQ==
X-Gm-Message-State: AElRT7HTWY8m/AqVhCqWR1KkjhNfhau3jgm4vN6v5aCKMIUvZQGUIxXn
	6Xr4wt39X2CixjgIABErsQl0+g33J0QvIJpksPM=
X-Google-Smtp-Source: AIpwx4/XJ6PbQaqY925ODVuqkaDA9/wDBEFbBXxVr2mw+fnRieNStEPirht7DZP4OCOthHOUUGXqDS+YlnemXhGvaI8=
X-Received: by 2002:a19:d78a:: with SMTP id
	q10-v6mr5118011lfi.94.1521814965040; 
	Fri, 23 Mar 2018 07:22:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 23 Mar 2018 07:22:44 -0700 (PDT)
In-Reply-To: <F0CA9E243F4F424B836EAC30E41BF4CF781DBB3F@PGSMSX104.gar.corp.intel.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF781DBB3F@PGSMSX104.gar.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Mar 2018 10:22:44 -0400
Message-ID: <CADkTA4NhcSuR7qFfr_mB_+s=W_QoDGeJ=hbAxwN_ZZUwJJHefg@mail.gmail.com>
To: "Tan, Raymond" <raymond.tan@intel.com>
Cc: "ray.danks@se-eng.com" <ray.danks@se-eng.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: [poky] lttng-modules build error on linux-yocto-4.4 with KVM on [rocko] branch
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
X-List-Received-Date: Fri, 23 Mar 2018 14:22:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2018 at 8:10 AM, Tan, Raymond <raymond.tan@intel.com> wrote=
:
> Dear Maintainers,
>
>
>
> I=E2=80=99m building the image core-image-sato-sdk on ROCKO branch with t=
he poky,
> meta-virtualization and meta-intel.
>
>
>
> When I enabled virtualization and kvm,
>
>
>
> DISTRO_FEATURES_append =3D " virtualization"
>
> DISTRO_FEATURES_append =3D " kvm"
>
>
>
> PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>
> PREFERRED_VERSION_linux-yocto ?=3D "4.4%"
>
>
>
> I get the error as follow :
>
>
>
> =E2=80=A6.
>
>                  from
> /home/rahul/raymond/workingdir/pyro/build/tmp/work/intel_corei7_64-poky-l=
inux/lttng-modules/2.9.5-r0/lttng-modules-2.9.5/probes/lttng-probe-kvm.c:42=
:
>
> /home/rahul/raymond/workingdir/pyro/build/tmp/work/intel_corei7_64-poky-l=
inux/lttng-modules/2.9.5-r0/lttng-modules-2.9.5/probes/../probes/lttng-trac=
epoint-event-impl.h:142:6:
> error: conflicting types for 'trace_kvm_mmio'
>
> void trace_##_name(_proto);
>
>       ^
>
> /home/rahul/raymond/workingdir/pyro/build/tmp/work/intel_corei7_64-poky-l=
inux/lttng-modules/2.9.5-r0/lttng-modules-2.9.5/probes/../probes/lttng-trac=
epoint-event-impl.h:54:2:
> note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
>
>   LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto),
> PARAMS(args))
>
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> =E2=80=A6..
>
>
>
> Checking online, same issue was reported with the lttng-modules 2.9.5 on
> kernel 4.9 as well, albeit in different project
> https://jira.automotivelinux.org/browse/SPEC-1302
>
>
>
> With the proposed solution in the AGL thread, updating lttng-modules to
> 2.10.5 does fix this issue, since 2.10.5 is upstreamed into master-branch=
,
> will this version be patched to ROCKO as well?

That question need to be answered on the oe-core list. Since we don't
carry lttng
in meta-virt, there's nothing we can do to fix it here.

Bruce

>
>
>
> /Ray



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

