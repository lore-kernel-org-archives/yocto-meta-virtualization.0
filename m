Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18335E0051D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 14:22:22 -0700 (PDT)
Received: by mail-lb0-f173.google.com with SMTP id t10so3673756lbi.32
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 14:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=zGwcJ6E19wo5yhMG9Zzs/F4ogdYFn2qhNb+KG4sHkv4=;
	b=xkfyhUF1DKTNQO/UQJRaNHPunMXKuWCO77laOqE+HViIKLyZ9zGsD6Ly/NyqsNIKK6
	kexX6CjWj0PgPcf9813LL+xaezLZsSuZRBf8fMY6qp/GiA9CCmCZuU1f5z4xwnF6Tr3P
	kDOnSrJmFcXtRb8AH6RbswQuJ/dAYqy07DqTLhNC/MsH16upBsv8EYys6rZXHH3osGWE
	EKuxUQ0D0kZykpR65CZEcNKDl8jSven4rlRVBQ07tmCuC2XJlUGhOlPza2VByzNSFG4D
	1resl0FQ7ktEvV1IGC4Y05O+3C4EmwMKqJ+SvyAYR0vk8k2QC07zcGOcgv8L2FsnOr9Q
	x8rw==
MIME-Version: 1.0
X-Received: by 10.112.155.67 with SMTP id vu3mr20435201lbb.109.1368739341660; 
	Thu, 16 May 2013 14:22:21 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Thu, 16 May 2013 14:22:21 -0700 (PDT)
In-Reply-To: <9D709999-1879-49C8-A4ED-B91B8DCB2500@spidercloud.com>
References: <mailman.1.1368126001.16184.meta-virtualization@yoctoproject.org>
	<9D709999-1879-49C8-A4ED-B91B8DCB2500@spidercloud.com>
Date: Thu, 16 May 2013 17:22:21 -0400
Message-ID: <CADkTA4OJKTGULXraqQa+Th-rMQX+PQ+n7F=+2VOYTM=5OY0KQw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ben Warren <Ben.Warren@spidercloud.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: meta-virtualization Digest, Vol 6, Issue 4
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
X-List-Received-Date: Thu, 16 May 2013 21:22:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2013 at 5:01 PM, Ben Warren <Ben.Warren@spidercloud.com> wr=
ote:
> Hi,
>
> A week's gone by and nothing but crickets.  Does anybody have an idea of =
what might be causing this build problem?  I'm not trying to do anything ex=
otic, just add meta-virtualization support to a bare-bones crystalforest (l=
ow power Xeon)-based platform.  The host is Ubuntu 12.10 64-bit.

Since I haven't been able to reproduce or see the error here, it's hard
to say.

gnutls is in the DEPENDS for libvirt, so everyone should be seeing this if
that was being detected and enabling functionality that wasn't being built.
A quick check of the Makefiles shows that the .c file with the implementati=
on
is being triggered from the same TLS enablement check.

Have you tried modifying the recipe to have an explicit: --with-gnutls (or
--without) ?

Cheers,

Bruce



>
> thanks,
> Ben
>
>> Date: Wed, 8 May 2013 13:57:45 -0700
>> From: Ben Warren <Ben.Warren@spidercloud.com>
>> To: "meta-virtualization@yoctoproject.org"
>>       <meta-virtualization@yoctoproject.org>
>> Subject: [meta-virtualization] `virNetTLSInit' link error when
>>       building        libvirt
>> Message-ID: <89EFFFA7-0CB8-409C-BF0F-2355ED1BA0FD@spidercloud.com>
>> Content-Type: text/plain; charset=3D"Windows-1252"
>>
>> Hello,
>>
>> I'm trying to add virtualization support to my Yocto project and can't g=
et libvirt to build.  In particular, the following link error occurs:
>>
>> | ../src/.libs/libvirt.so: undefined reference to `virNetTLSInit'
>> | collect2: error: ld returned 1 exit status
>>
>> Looking at the code, this function is conditionally compiled as:
>>
>> #ifdef WITH_GNUTLS
>>    virNetTLSInit();
>> #endif
>>
>> and the function itself is here:
>> libvirt-1.0.3/src/rpc/virnettlscontext.c
>>
>> I don't see any .o files in that 'rpc' directory, so it appears that the=
 files aren't being compiled, hence the link error.
>>
>> I'm using the following code revisions:
>>       ? poky @ git tag 'dylan 9.0.0'
>>       ? meta-virtualization @ git commit 22e7b5e92b33e5fe18723083ce69867=
749839894 (5/3/2013)
>>       ? meta-oa @ git commit a8b96b69bd418b74f48dc4d111caac676ae667f5 (4=
/27/2013 from git://github.com/openembedded/meta-oe.git)
>>
>> My build command line is:
>>
>> MACHINE=3Dscw-appscard bitbake kvm-image-minimal
>>
>> where the 'scw_appscard' BSP is identical to 'crystalforest' (x86_64) wi=
th some kernel config modifications.
>>
>> My bblayers are:
>> BBLAYERS ?=3D " \
>>  /opt/poky/meta \
>>  /opt/poky/meta-yocto \
>>  /opt/poky/meta-yocto-bsp \
>>  /opt/meta-oe/meta-oe \
>>  /opt/meta-oe/meta-networking \
>>  /opt/meta-virtualization \
>>  /opt/meta-scw-appscard \
>>  "
>>
>> Does anybody have insight as to why this won't build?
>>
>> thanks,
>> Ben
>>
>> ------------------------------
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

