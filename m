Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0B2DE00443
	for <meta-virtualization@yoctoproject.org>;
	Sat, 24 Aug 2013 22:29:12 -0700 (PDT)
Received: by mail-la0-f41.google.com with SMTP id ec20so1571312lab.0
	for <meta-virtualization@yoctoproject.org>;
	Sat, 24 Aug 2013 22:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=xuOCaUxoBmlAlvOv56EkBhtzvT1oZZlh1O6kcqxQv8g=;
	b=HtWFdfHS9O8Zs3DC3vr6Di6anSqu9tQP8PTrtJXsizBk2IGindndhdFpRzVG4t2zEm
	Ehf9VrjCgzKmLGEBBlEywu6B/qo1yJk/tOqAFaWQ75vK51Rk/uuJF9e/YWCRDTOWZCsx
	FiPWU4Vp0xC8CXvn8Dmwj5yYZTBijZkc9h/VnYooezfCmji/LURmmpOp2lc97Y9wihN8
	f+5g4Dpbcmytj8O1EZUzZmpdXT4UYPwp5thSg6llgaiwx+57H/1bvzn5+e9WvyE+KyI1
	+OoCXJRV4OmJCKG+V0pUqw+Y412JBl9Rn64KpGYdYqBv2iF9Ze6VeiJnZShKDtWIitX+
	sofA==
MIME-Version: 1.0
X-Received: by 10.152.29.103 with SMTP id j7mr7183487lah.7.1377408550408; Sat,
	24 Aug 2013 22:29:10 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Sat, 24 Aug 2013 22:29:10 -0700 (PDT)
In-Reply-To: <5215C3F6.5040000@enea.com>
References: <1377094573-30072-1-git-send-email-david.nystrom@enea.com>
	<CADkTA4NHoDDeP1C262yZ=dj3+eqJUa2vuBw4xPHLiN4exnhfVQ@mail.gmail.com>
	<5215C3F6.5040000@enea.com>
Date: Sun, 25 Aug 2013 01:29:10 -0400
Message-ID: <CADkTA4PaOEFsd7Dw1E3eRXf9hiPytMa3FAaZjZ1Wbo+xVtEtfg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Fixed Q&A error for OpenFlow recipe
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
X-List-Received-Date: Sun, 25 Aug 2013 05:29:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2013 at 3:55 AM, David Nystr=F6m <david.nystrom@enea.com> w=
rote:
> $ bitbake openflow
> WARNING: Host distribution "Ubuntu-13.10" has not been validated with thi=
s
> version of the build system; you may possibly experience unexpected
> failures. It is recommended that you use a tested distribution.
> Loading cache: 100%
> |######################################################################|
> ETA:  00:00:00
> Loaded 1727 entries from dependency cache.
> Parsing recipes: 100%
> |####################################################################| Ti=
me:
> 00:00:00
> Parsing of 1336 .bb files complete (1335 cached, 1 parsed). 1726 targets,=
 38
> skipped, 0 masked, 0 errors.
>
> Build Configuration:
> BB_VERSION        =3D "1.19.1"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-13.10"
> TARGET_SYS        =3D "x86_64-poky-linux"
> MACHINE           =3D "qemux86-64"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.4+snapshot-20130822"
> TUNE_FEATURES     =3D "m64"
> TARGET_FPU        =3D ""
> meta
> meta-yocto
> meta-yocto-bsp    =3D "master:b2ff1add530b1fec2fb7f385227a03db47015c37"
> meta-oe
> meta-networking   =3D "master:d4571b3d94d999ad54d8965f0d049dcfd34da504"
> meta-virtualization =3D "master:ef0700820686d262fa28091b8e143fc881f69965"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: QA Issue: openflow: Files/directories were installed but not shipp=
ed
>   /run

Ah yes. I've seen this same QA error here. I've actually just packaged it
in the past to avoid the same error .. with no ill effects at runtime.

But this works just as well.

I was working on some code, so I tweaked the commit message and pushed
out your two pending changes.

Cheers,

Bruce

> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in:
> /media/sdb5/eel/build/tmp/work/x86_64-poky-linux/openflow/1.0+gitAUTOINC+=
5ccca75a69-r0/temp/log.do_package.14523
> ERROR: Task 10
> (/media/sdb5/eel/meta-virtualization/recipes-networking/openflow/openflow=
_1.0.bb,
> do_package) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 578 tasks of which 576 didn't need to be
> rerun and 1 failed.
> No currently running tasks (577 of 582)
>
> Summary: 1 task failed:
>
> /media/sdb5/eel/meta-virtualization/recipes-networking/openflow/openflow_=
1.0.bb,
> do_package
> Summary: There was 1 WARNING message shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.
>
>
> Br,
> David
>
>
>
>
> On 08/22/2013 02:54 AM, Bruce Ashfield wrote:
>>
>> Can you dump the QA recipe here for the long log ? I've been building th=
is
>> and
>> haven't seen it myself. So I'm curious to see what it is .. with it in
>> the commit log,
>> I'll know if I see it.
>>
>> On Wed, Aug 21, 2013 at 10:16 AM, David Nystr=F6m
>> <david.c.nystrom@gmail.com> wrote:
>>>
>>> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
>>> ---
>>>   recipes-networking/openflow/openflow_1.0.bb | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/recipes-networking/openflow/openflow_1.0.bb
>>> b/recipes-networking/openflow/openflow_1.0.bb
>>> index 3663e50..20a2bc9 100644
>>> --- a/recipes-networking/openflow/openflow_1.0.bb
>>> +++ b/recipes-networking/openflow/openflow_1.0.bb
>>> @@ -1,4 +1,4 @@
>>> -SUMMARY =3D "OpelFlow"
>>> +SUMMARY =3D "OpenFlow"
>>
>>
>> I for one liked the OpelFlow support! :)
>>
>>>   DESCRIPTION =3D "Provide a generic framework for handling devices in
>>> userspace."
>>>   HOMEPAGE =3D "http://www.openflow.org"
>>>   SECTION =3D "networking"
>>> @@ -21,4 +21,9 @@ PACKAGECONFIG[libssl] =3D "--enable-ssl,--disable-ssl=
,
>>> openssl, libssl"
>>>
>>>   S =3D "${WORKDIR}/git"
>>>
>>> -inherit autotools
>>> \ No newline at end of file
>>> +inherit autotools
>>> +
>>> +do_install_append() {
>>> +       # Remove /var/run as it is created on startup
>>> +        rm -rf ${D}${localstatedir}/run
>>> +}
>>
>>
>> Indeed .. this will get populated without OpenFlow's help.
>>
>> Bruce
>>
>>> --
>>> 1.8.3.2
>>>
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

