Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48545E00CCA; Thu, 12 Oct 2017 04:58:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.44 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.44 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 804B2E00CC1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 04:58:18 -0700 (PDT)
Received: by mail-wm0-f44.google.com with SMTP id f4so12682620wme.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jq+mp0ZuakGu9NFqM+3/Ec9I/3Hykm1o/mMaREIZIm0=;
	b=zOVzwg7Dzkp3qC7+uF8rXJPBUmCxnPQBChju+z99qB5s7nRleus20i/U4h0gP2crk5
	ogAjfM0RhDvn/94YuuJU9M5BQpg3yugUGwq1Cpf0haBEb5FtoIFZxOmUWDb+5KqItOCu
	4WhA25mTGTNKYxs6wClP+sBV+2yCx8Fvt2Vj5LcnojOQGwSpq2DuUKbpL24wZGFue86C
	wRBXNT/b7d4fJi9HI2Sloc/vNTmR7BAHVI3mxBI/p0hdEdmx/rOKBpHXO/741IU3JxiS
	fwzWuG4A4k+0L4yaCClWxF6GLiX+Sz+o+9hUxzJ5OR8kXuzJk+HXby6KXZo6DjW+geRw
	H5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jq+mp0ZuakGu9NFqM+3/Ec9I/3Hykm1o/mMaREIZIm0=;
	b=oRNfhBgZb544xRqGxb6soqjNDGj6C40RPySntcGh2JMJDTmXCn7yCz5TMBZsdKgHDg
	tuxa76HMcZzN+0zdk8LVmHvwZ3mI2Bd5IwkaG8ElUCBola0xLFjIf7EmX6+NBoKrAUCx
	1ZCn53LDf7CvcHOYCp8SmVZAw1moRtvqfZbxiXwdmUmWWTUI8HLmhrfEbQoK/JCLLRzQ
	b9JpeIuGX0zu51t1x+4IigjxHwAYgkz/0Ayt/BhQ0fMGza80J3WiHkAyQlF5lqmnYdP5
	jWdvggqJrPve6Im+lAdrF7t4t5edw3/J/lbJX3O5oiacNyPKQkA7R/XsEkQYosXk6mMC
	DszQ==
X-Gm-Message-State: AMCzsaWuK5gVaBD7/2qhFulvsc5ab0C9QO9oI6YujmkkuF+8zNn53qYT
	n+MhL2oFCU2WVm24U+Hk2bi6DMiQ7MsoeeozODjQdw==
X-Google-Smtp-Source: AOwi7QBgpSnOfviagtYYVxJL72eCfZ7G4bd4iFQejHHzeHGJ1+ui2Yd1sZnVp9RPaUDhD6N/GjjU8qycLfWL4f/uDOc=
X-Received: by 10.223.172.78 with SMTP id v72mr1739343wrc.140.1507809497291;
	Thu, 12 Oct 2017 04:58:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Thu, 12 Oct 2017 04:58:16 -0700 (PDT)
In-Reply-To: <CAPyrkgzg7bk91F6otNxD7hsup1sp1WMzoED9UNorJa-zEeS_HA@mail.gmail.com>
References: <20171009195421.17393-1-limon.anibal@gmail.com>
	<CAPyrkgxJLawo+vREn_HoV9FjLX6s4gz0+2952A75uCmhur+nwg@mail.gmail.com>
	<CADkTA4Mxe=+hQjSmWGCzC97ftaM=52dsMxyevowELySZTaNg4g@mail.gmail.com>
	<CAPyrkgzg7bk91F6otNxD7hsup1sp1WMzoED9UNorJa-zEeS_HA@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 12 Oct 2017 12:58:16 +0100
Message-ID: <CAPyrkgyBvPgL+SwSqX5RcjSn+DPFKGfPVfmkCt5=8qqDO-BUBw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Subject: Re: [PATCH] Revert "runc: Don't override GOARCH or GOROOT"
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
X-List-Received-Date: Thu, 12 Oct 2017 11:58:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 12:30 AM, Paul Barker <pbarker@toganlabs.com> wrote=
:
> On Tue, Oct 10, 2017 at 12:02 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Mon, Oct 9, 2017 at 5:56 PM, Paul Barker <pbarker@toganlabs.com> wrot=
e:
>>>
>>> It seems like we have conflicting changes :( Reverting this patch will
>>> break cross-compilation of runc-opencontainers for x86-64 with musl
>>> libc again.
>>>
>>> I'll try cross-compiling both runc variants for arm, aarch64, x86 and
>>> x86-64 and see if I can find a solution that works for everything.
>>>
>>
>> Agreed.
>>
>> I'll hold off on any revert until I hear from your tests.
>>
>> For the configs I'm using everything is building with the current set
>> of changes.
>>
>> Bruce
>>
>
> I can re-produce the failure by building runc-docker for
> raspberrypi3-64. However, runc-opencontainers builds successfully for
> raspberrypi3-64. So at worst we can add a do_compile_prepend() in the
> recipe for runc-docker (but not the common .inc file). However, the
> whole thing looks wrong, GOROOT shouldn't be pointing at the native
> sysroot at all. There's probably something strange going on in the
> runc-docker makefile.
>

I've found that the issue is with building the recvtty demo/reference
application within runc-docker. That's under a contrib directory in
the source tree and isn't a core part of the runc application. If I
patch out the line in the Makefile which builds recvtty then the build
succeeds for all platforms I build tested (qemux86, qemux86-64,
raspberrypi, raspberrypi2, raspberrypi3, raspberrypi3-64).

So I'm going to propose we just patch out the compilation of recvtty
for this recipe unless someone is actually using it. An=C3=ADbal, is this
ok for you?

Thanks,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

