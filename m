Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B49A4E008D0; Mon,  3 Nov 2014 07:43:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.169 listed in list.dnswl.org]
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37557E00874
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Nov 2014 07:43:19 -0800 (PST)
Received: by mail-lb0-f169.google.com with SMTP id p9so3895862lbv.28
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Nov 2014 07:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=kACeyn7YT/Bpu1F58sUg2pGc3M+4BWAXF8OS91CENlY=;
	b=ds3irAm6MXl5QPIV29hzpH3uq109GKj5K3x/WcSc4eEHcNswnYbcdtWfBKVFz79Ddz
	n6pxSKBn3avpf4O0Kwa8lSwMnwq1fbyPGZn5Pb/pstd6WrfoB8ey8sBVSZLruHR997Vx
	dBvl/xF42ETda1+yE6lll7ojRMLV9Qy1Pthd3B4sa9wHFhDv3wUFpPIxzvu6RgAaYx+z
	Icxn/SgTxDV4Auia/eckZmDTqENhtZhmtNxMGUfdjTQeRDa4BhXihEFi/+sSNF+mMHss
	J4yRBysu3kj+Tivje4EgFgL9pGWGQHbhv1/GlAVZfvVUVlmqmrsK9QWRSs55gwsHl0Ar
	pdog==
MIME-Version: 1.0
X-Received: by 10.152.27.38 with SMTP id q6mr13739522lag.92.1415029397878;
	Mon, 03 Nov 2014 07:43:17 -0800 (PST)
Received: by 10.112.4.168 with HTTP; Mon, 3 Nov 2014 07:43:17 -0800 (PST)
In-Reply-To: <3d2c4f00be3b4a57814735b9ecd909ec@BL2PR03MB497.namprd03.prod.outlook.com>
References: <3d2c4f00be3b4a57814735b9ecd909ec@BL2PR03MB497.namprd03.prod.outlook.com>
Date: Mon, 3 Nov 2014 10:43:17 -0500
Message-ID: <CADkTA4PYTW8_x-ZVaxSQXC319T+593z97gp=bnEmG_UamKnVuA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Benlei Xu <B51469@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: openstack dashboard can not use console, need your help
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
X-List-Received-Date: Mon, 03 Nov 2014 15:43:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2014 at 12:49 AM, Benlei Xu <B51469@freescale.com> wrote:
> Hello all,
>
>
>
>                 I have a issue need to ensure, I am launching instance on
> powerpc arch board, but there is a issue  that =E2=80=9CError: internal e=
rror:
> process exited while connecting to monitor: VNC support is disabled=E2=80=
=9D. If
> =E2=80=9Cvnc_enabled=E2=80=9D is set False in nova.conf, the instance can=
 created
> successfully.  I guess that there is no vnc server in yocto packages.
>
>
>
>                 So,  I want to know, where yocto support vnc server or no=
t
> and how can I get vnc server package on powerpc arch.

I answered this question on the oe-core list. vnc console does work, and is
tested along side of the spice console support. Everything is that is requi=
red
is in the meta-openstack layer.

What branch are you using ? Are you seeing a particular error ?

Bruce

>
>
>
> Thanks.
>
>
>
> Best Regards,
>
> Benlei
>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

