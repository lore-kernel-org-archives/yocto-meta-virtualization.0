Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96EBDE0076C; Thu,  2 Oct 2014 10:01:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (adam.yh.lee[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A0B8E00749
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Oct 2014 10:01:24 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id hq11so1638867vcb.21
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 Oct 2014 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NpbqtRfgyqNEZFt5DAyqSjehBWtik7ANQ6TVVdUQhZU=;
	b=R4r+K80Yn8P0VrEdEQR3oVgDFJhd9wzM/RinP0ueVFUTGS3MdvZJZNAiIteeLNfwRJ
	ByMTJWjyHULrXecafDGVlEVgl1cnWVgdzW5/VnD2/60ClMhDoWK2CZh+KfVy/BSKJMLg
	OhuTIOOkMZW3TDkVJ7SD71f07VfofQ2uU9ZB8RsmLCO4l0iP5hxKTvUcMZHqIw00O+2l
	Tgyd/KLKMOhYaDFZdd3h3wMKa2qh9NAzDmK8RxtVpc49AA62dxwYY2vE6zEKbCNWRX5O
	34FffnSvwzEil1dcFiS/WCQYw2PnuhOnVfGReKpCT4h9isaZzsNIyFsNmEUI2U0I9V1T
	gfWQ==
MIME-Version: 1.0
X-Received: by 10.52.30.2 with SMTP id o2mr133420vdh.12.1412269283279; Thu, 02
	Oct 2014 10:01:23 -0700 (PDT)
Received: by 10.52.112.65 with HTTP; Thu, 2 Oct 2014 10:01:23 -0700 (PDT)
In-Reply-To: <CADkTA4MSNGX2Lf0sL3x5YxPNZE3bHpYFFjEVeupjagQoXBi=pw@mail.gmail.com>
References: <CAFeBWL5qa-SEyJ-cwup-PLHszx0X+yy9aKOjCneis7fm5zJtYw@mail.gmail.com>
	<CADkTA4Mu5hZz5Y4HTopSH46iBe4je=Hs899Fm13yrsJMnXkFNg@mail.gmail.com>
	<CAFeBWL7WnEY=WMUvz508mKhiJj5NC3veckuQxPYAhnMMsHfLmw@mail.gmail.com>
	<CADkTA4MSNGX2Lf0sL3x5YxPNZE3bHpYFFjEVeupjagQoXBi=pw@mail.gmail.com>
Date: Thu, 2 Oct 2014 10:01:23 -0700
Message-ID: <CAFeBWL7+YWR6GjdSpVmoxGy-=E6o3Ocnw=-YheR8by=CHTOgRg@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: uwsgi fails to get packaged with bad RPATH
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
X-List-Received-Date: Thu, 02 Oct 2014 17:01:28 -0000
Content-Type: multipart/alternative; boundary=20cf307d06b2f509bd05047390ff

--20cf307d06b2f509bd05047390ff
Content-Type: text/plain; charset=UTF-8

Thanks Bruce, I appreciate your help on this.

May I get your target also (MACHINE)?

Regards,

Adam

On Wed, Oct 1, 2014 at 10:34 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Wed, Oct 1, 2014 at 1:09 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Thanks Bruce, can I have some information about your setup? Yocto
> version,
> > layers involved?
> >
> > I appreciate it!
>
> I'm always building the HEAD of pretty much everything, since that's where
> I
> do all the development.
>
> So in my case:
>
> meta
>
> meta-yocto
>
> meta-yocto-bsp    = "master:d6da1f78cbf29c6c9ee3e0857a403e53daed256e"
>
> meta-kernel-dev   = "master:7235853e3d88ace1d4a8784ba533e676a0e74edd"
>
> meta-virtualization = "master:f5d690a773052c3406936d7e0f2e6af6b24c77c2"
>
> meta-networking
>
> meta-filesystems
>
> meta-webserver
>
> meta-python
>
> meta-oe
>
> meta-ruby         = "master:28e26a9b0ad37d0c92ba42b2727215eef1edf5a2"
>
> meta-cloud-services
>
> meta-openstack-controller-deploy
>
> meta-openstack
>
> meta-openstack-qemu = "master:d8c7fe8aa19b28249e50ea69127c392743d028dd"
>
> Bruce
>
>
> >
> > Adam
> >
> > On Tue, Sep 30, 2014 at 10:02 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> > wrote:
> >>
> >> On Tue, Sep 30, 2014 at 6:43 PM, Adam Lee <adam.yh.lee@gmail.com>
> wrote:
> >> > Hello everyone, I am building uwsgi as a part of my image to run a web
> >> > application on my embedded board.
> >> >
> >> > Ingredients including nginx builds fine, but I am getting the error
> >> > attached. I am building on Yocto Project 1.6.1 (current master).
> >>
> >> Hmmm. I just did a completely clean build and didn't get any QA errors
> >> with
> >> respect to rpath.
> >>
> >> Hopefully someone else is seeing this and can help isolate the issue.
> >>
> >> Bruce
> >>
> >> >
> >> > Any insight will be greatly appreciated!
> >> >
> >> > Adam
> >> >
> >> >> DEBUG: Executing python function sstate_task_prefunc
> >> >> DEBUG: Python function sstate_task_prefunc finished
> >> >> DEBUG: Executing python function do_package
> >> >> DEBUG: Executing python function package_get_auto_pr
> >> >> DEBUG: Python function package_get_auto_pr finished
> >> >> DEBUG: Executing python function perform_packagecopy
> >> >> DEBUG: Python function perform_packagecopy finished
> >> >> DEBUG: Executing python function split_and_strip_files
> >> >> DEBUG: runstrip: 'arm-poky-linux-gnueabi-strip'
> >> >> --remove-section=.comment
> >> >> --remove-section=.note
> >> >>
> >> >>
> '/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi'
> >> >> DEBUG: Python function split_and_strip_files finished
> >> >> DEBUG: Executing python function fixup_perms
> >> >> DEBUG: Python function fixup_perms finished
> >> >> DEBUG: Executing python function package_do_split_locales
> >> >> DEBUG: No locale files in this package
> >> >> DEBUG: Python function package_do_split_locales finished
> >> >> DEBUG: Executing python function populate_packages
> >> >> DEBUG: Python function populate_packages finished
> >> >> DEBUG: Executing python function do_package_qa
> >> >> NOTE: DO PACKAGE QA
> >> >> NOTE: Checking Package: uwsgi-staticdev
> >> >> NOTE: Checking Package: uwsgi-dev
> >> >> NOTE: Checking Package: uwsgi-dbg
> >> >> NOTE: arm-poky-linux-gnueabi-objdump -p
> >> >>
> >> >>
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/usr/bin/.debug/uwsgi
> >> >> NOTE: Checking Package: uwsgi-doc
> >> >> NOTE: Checking Package: uwsgi
> >> >> NOTE: arm-poky-linux-gnueabi-objdump -p
> >> >>
> >> >>
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
> >> >> ERROR: QA Issue: package uwsgi contains bad RPATH
> >> >> /media/Build/master/build/tmp/sysroots/duovero/usr/lib in file
> >> >>
> >> >>
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
> >> >> ERROR: QA run found fatal errors. Please consider fixing them.
> >> >> DEBUG: Python function do_package_qa finished
> >> >> DEBUG: Python function do_package finished
> >> >> ERROR: Function failed: do_package_qa
> >> >
> >> >
> >> >
> >> > --
> >> > _______________________________________________
> >> > meta-virtualization mailing list
> >> > meta-virtualization@yoctoproject.org
> >> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >> >
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--20cf307d06b2f509bd05047390ff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" style=3D"font-family:arial,sans-serif;fon=
t-size:13px">Thanks Bruce, I appreciate your help on this.=C2=A0<div><br></=
div><div>May I get your target also (MACHINE)?=C2=A0</div><div><br></div><d=
iv>Regards,</div><div><br></div><div>Adam</div></div><div class=3D"" style=
=3D"font-family:arial,sans-serif;font-size:13px"><div id=3D":12i" class=3D"=
" tabindex=3D"0"><img class=3D"" src=3D"https://ssl.gstatic.com/ui/v1/icons=
/mail/images/cleardot.gif"></div></div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Wed, Oct 1, 2014 at 10:34 AM, Bruce Ashfield=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><span class=3D"">On Wed, Oct 1, 2014 at 1:09 PM, Adam Lee=
 &lt;<a href=3D"mailto:adam.yh.lee@gmail.com">adam.yh.lee@gmail.com</a>&gt;=
 wrote:<br>
&gt; Thanks Bruce, can I have some information about your setup? Yocto vers=
ion,<br>
&gt; layers involved?<br>
&gt;<br>
&gt; I appreciate it!<br>
<br>
</span>I&#39;m always building the HEAD of pretty much everything, since th=
at&#39;s where I<br>
do all the development.<br>
<br>
So in my case:<br>
<br>
meta<br>
<br>
meta-yocto<br>
<br>
meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;master:d6da1f78cbf29c6c9ee3e0857a403e=
53daed256e&quot;<br>
<br>
meta-kernel-dev=C2=A0 =C2=A0=3D &quot;master:7235853e3d88ace1d4a8784ba533e6=
76a0e74edd&quot;<br>
<br>
meta-virtualization =3D &quot;master:f5d690a773052c3406936d7e0f2e6af6b24c77=
c2&quot;<br>
<br>
meta-networking<br>
<br>
meta-filesystems<br>
<br>
meta-webserver<br>
<br>
meta-python<br>
<br>
meta-oe<br>
<br>
meta-ruby=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:28e26a9b0ad37d0=
c92ba42b2727215eef1edf5a2&quot;<br>
<br>
meta-cloud-services<br>
<br>
meta-openstack-controller-deploy<br>
<br>
meta-openstack<br>
<br>
meta-openstack-qemu =3D &quot;master:d8c7fe8aa19b28249e50ea69127c392743d028=
dd&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Bruce<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; Adam<br>
&gt;<br>
&gt; On Tue, Sep 30, 2014 at 10:02 PM, Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Sep 30, 2014 at 6:43 PM, Adam Lee &lt;<a href=3D"mailto:ad=
am.yh.lee@gmail.com">adam.yh.lee@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Hello everyone, I am building uwsgi as a part of my image to =
run a web<br>
&gt;&gt; &gt; application on my embedded board.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ingredients including nginx builds fine, but I am getting the=
 error<br>
&gt;&gt; &gt; attached. I am building on Yocto Project 1.6.1 (current maste=
r).<br>
&gt;&gt;<br>
&gt;&gt; Hmmm. I just did a completely clean build and didn&#39;t get any Q=
A errors<br>
&gt;&gt; with<br>
&gt;&gt; respect to rpath.<br>
&gt;&gt;<br>
&gt;&gt; Hopefully someone else is seeing this and can help isolate the iss=
ue.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Any insight will be greatly appreciated!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Adam<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function sstate_task_prefunc<br>
&gt;&gt; &gt;&gt; DEBUG: Python function sstate_task_prefunc finished<br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function do_package<br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function package_get_auto_pr<br>
&gt;&gt; &gt;&gt; DEBUG: Python function package_get_auto_pr finished<br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function perform_packagecopy<br>
&gt;&gt; &gt;&gt; DEBUG: Python function perform_packagecopy finished<br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function split_and_strip_files<br=
>
&gt;&gt; &gt;&gt; DEBUG: runstrip: &#39;arm-poky-linux-gnueabi-strip&#39;<b=
r>
&gt;&gt; &gt;&gt; --remove-section=3D.comment<br>
&gt;&gt; &gt;&gt; --remove-section=3D.note<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &#39;/media/Build/master/build/tmp/work/armv7a-vfp-neon-p=
oky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsg=
i&#39;<br>
&gt;&gt; &gt;&gt; DEBUG: Python function split_and_strip_files finished<br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function fixup_perms<br>
&gt;&gt; &gt;&gt; DEBUG: Python function fixup_perms finished<br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function package_do_split_locales=
<br>
&gt;&gt; &gt;&gt; DEBUG: No locale files in this package<br>
&gt;&gt; &gt;&gt; DEBUG: Python function package_do_split_locales finished<=
br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function populate_packages<br>
&gt;&gt; &gt;&gt; DEBUG: Python function populate_packages finished<br>
&gt;&gt; &gt;&gt; DEBUG: Executing python function do_package_qa<br>
&gt;&gt; &gt;&gt; NOTE: DO PACKAGE QA<br>
&gt;&gt; &gt;&gt; NOTE: Checking Package: uwsgi-staticdev<br>
&gt;&gt; &gt;&gt; NOTE: Checking Package: uwsgi-dev<br>
&gt;&gt; &gt;&gt; NOTE: Checking Package: uwsgi-dbg<br>
&gt;&gt; &gt;&gt; NOTE: arm-poky-linux-gnueabi-objdump -p<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-l=
inux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/=
usr/bin/.debug/uwsgi<br>
&gt;&gt; &gt;&gt; NOTE: Checking Package: uwsgi-doc<br>
&gt;&gt; &gt;&gt; NOTE: Checking Package: uwsgi<br>
&gt;&gt; &gt;&gt; NOTE: arm-poky-linux-gnueabi-objdump -p<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-l=
inux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/=
bin/uwsgi<br>
&gt;&gt; &gt;&gt; ERROR: QA Issue: package uwsgi contains bad RPATH<br>
&gt;&gt; &gt;&gt; /media/Build/master/build/tmp/sysroots/duovero/usr/lib in=
 file<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-l=
inux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/=
bin/uwsgi<br>
&gt;&gt; &gt;&gt; ERROR: QA run found fatal errors. Please consider fixing =
them.<br>
&gt;&gt; &gt;&gt; DEBUG: Python function do_package_qa finished<br>
&gt;&gt; &gt;&gt; DEBUG: Python function do_package finished<br>
&gt;&gt; &gt;&gt; ERROR: Function failed: do_package_qa<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; meta-virtualization mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-=
virtualization@yoctoproject.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtu=
alization" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-v=
irtualization</a><br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await<br>
&gt;&gt; thee at its end&quot;<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></blockquote></div><br></div>

--20cf307d06b2f509bd05047390ff--
