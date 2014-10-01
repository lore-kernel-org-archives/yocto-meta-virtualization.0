Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CDD3CE0077F; Wed,  1 Oct 2014 10:09:56 -0700 (PDT)
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
	*      [209.85.220.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE6B1E006DB
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Oct 2014 10:09:52 -0700 (PDT)
Received: by mail-vc0-f182.google.com with SMTP id la4so563111vcb.41
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 Oct 2014 10:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FF8kEXNIZIsL1ECUfPqL+4MJ+9UdbXaXYaZtZiHJzv8=;
	b=tMVDRUnt7VUdITURloUXoVtid5JxOBlD7dkFBysV5tp7ScEt0OQ5TQpwaGNi/H0o1f
	kRibKc+pOEFgzJVAAYh5HPTUK4jOqsb7KP8PQqoWVxc82mbPkKscMFk5m9oFWc2XyOTI
	irqrXo1k8HLaeGuHVEKuscNffU3on1R+TVVEk25uX/WwEyRDpmwOjDWLM2a2U52Lvwpt
	g++5bxHX4R5rETBpwwEoEd34Sh+U548xxxuPVrowmo/wLmsiyn0zakKPCTO70PS9+RNR
	etpIiH7Uba9b4K1sEAVRTksuo4Im1pHPVzQHRIYOBKDCeZPdPJBZhd60Mheaz9IzhJ4b
	cdNQ==
MIME-Version: 1.0
X-Received: by 10.52.112.134 with SMTP id iq6mr2401892vdb.65.1412183391654;
	Wed, 01 Oct 2014 10:09:51 -0700 (PDT)
Received: by 10.52.112.65 with HTTP; Wed, 1 Oct 2014 10:09:51 -0700 (PDT)
In-Reply-To: <CADkTA4Mu5hZz5Y4HTopSH46iBe4je=Hs899Fm13yrsJMnXkFNg@mail.gmail.com>
References: <CAFeBWL5qa-SEyJ-cwup-PLHszx0X+yy9aKOjCneis7fm5zJtYw@mail.gmail.com>
	<CADkTA4Mu5hZz5Y4HTopSH46iBe4je=Hs899Fm13yrsJMnXkFNg@mail.gmail.com>
Date: Wed, 1 Oct 2014 10:09:51 -0700
Message-ID: <CAFeBWL7WnEY=WMUvz508mKhiJj5NC3veckuQxPYAhnMMsHfLmw@mail.gmail.com>
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
X-List-Received-Date: Wed, 01 Oct 2014 17:09:56 -0000
Content-Type: multipart/alternative; boundary=bcaec548a1d16ada2d05045f9141

--bcaec548a1d16ada2d05045f9141
Content-Type: text/plain; charset=UTF-8

Thanks Bruce, can I have some information about your setup? Yocto version,
layers involved?

I appreciate it!

Adam

On Tue, Sep 30, 2014 at 10:02 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Sep 30, 2014 at 6:43 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Hello everyone, I am building uwsgi as a part of my image to run a web
> > application on my embedded board.
> >
> > Ingredients including nginx builds fine, but I am getting the error
> > attached. I am building on Yocto Project 1.6.1 (current master).
>
> Hmmm. I just did a completely clean build and didn't get any QA errors with
> respect to rpath.
>
> Hopefully someone else is seeing this and can help isolate the issue.
>
> Bruce
>
> >
> > Any insight will be greatly appreciated!
> >
> > Adam
> >
> >> DEBUG: Executing python function sstate_task_prefunc
> >> DEBUG: Python function sstate_task_prefunc finished
> >> DEBUG: Executing python function do_package
> >> DEBUG: Executing python function package_get_auto_pr
> >> DEBUG: Python function package_get_auto_pr finished
> >> DEBUG: Executing python function perform_packagecopy
> >> DEBUG: Python function perform_packagecopy finished
> >> DEBUG: Executing python function split_and_strip_files
> >> DEBUG: runstrip: 'arm-poky-linux-gnueabi-strip'
> --remove-section=.comment
> >> --remove-section=.note
> >>
> '/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi'
> >> DEBUG: Python function split_and_strip_files finished
> >> DEBUG: Executing python function fixup_perms
> >> DEBUG: Python function fixup_perms finished
> >> DEBUG: Executing python function package_do_split_locales
> >> DEBUG: No locale files in this package
> >> DEBUG: Python function package_do_split_locales finished
> >> DEBUG: Executing python function populate_packages
> >> DEBUG: Python function populate_packages finished
> >> DEBUG: Executing python function do_package_qa
> >> NOTE: DO PACKAGE QA
> >> NOTE: Checking Package: uwsgi-staticdev
> >> NOTE: Checking Package: uwsgi-dev
> >> NOTE: Checking Package: uwsgi-dbg
> >> NOTE: arm-poky-linux-gnueabi-objdump -p
> >>
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/usr/bin/.debug/uwsgi
> >> NOTE: Checking Package: uwsgi-doc
> >> NOTE: Checking Package: uwsgi
> >> NOTE: arm-poky-linux-gnueabi-objdump -p
> >>
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
> >> ERROR: QA Issue: package uwsgi contains bad RPATH
> >> /media/Build/master/build/tmp/sysroots/duovero/usr/lib in file
> >>
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
> >> ERROR: QA run found fatal errors. Please consider fixing them.
> >> DEBUG: Python function do_package_qa finished
> >> DEBUG: Python function do_package finished
> >> ERROR: Function failed: do_package_qa
> >
> >
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--bcaec548a1d16ada2d05045f9141
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Bruce, can I have some information about your setup=
? Yocto version, layers involved?=C2=A0<div><br></div><div>I appreciate it!=
</div><div><br></div><div>Adam</div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Tue, Sep 30, 2014 at 10:02 PM, Bruce Ashfield <=
span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"=
_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Tue, Sep 30, 2014 at 6:43 PM, Adam Lee &l=
t;<a href=3D"mailto:adam.yh.lee@gmail.com">adam.yh.lee@gmail.com</a>&gt; wr=
ote:<br>
&gt; Hello everyone, I am building uwsgi as a part of my image to run a web=
<br>
&gt; application on my embedded board.<br>
&gt;<br>
&gt; Ingredients including nginx builds fine, but I am getting the error<br=
>
&gt; attached. I am building on Yocto Project 1.6.1 (current master).<br>
<br>
</span>Hmmm. I just did a completely clean build and didn&#39;t get any QA =
errors with<br>
respect to rpath.<br>
<br>
Hopefully someone else is seeing this and can help isolate the issue.<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Any insight will be greatly appreciated!<br>
&gt;<br>
&gt; Adam<br>
&gt;<br>
&gt;&gt; DEBUG: Executing python function sstate_task_prefunc<br>
&gt;&gt; DEBUG: Python function sstate_task_prefunc finished<br>
&gt;&gt; DEBUG: Executing python function do_package<br>
&gt;&gt; DEBUG: Executing python function package_get_auto_pr<br>
&gt;&gt; DEBUG: Python function package_get_auto_pr finished<br>
&gt;&gt; DEBUG: Executing python function perform_packagecopy<br>
&gt;&gt; DEBUG: Python function perform_packagecopy finished<br>
&gt;&gt; DEBUG: Executing python function split_and_strip_files<br>
&gt;&gt; DEBUG: runstrip: &#39;arm-poky-linux-gnueabi-strip&#39; --remove-s=
ection=3D.comment<br>
&gt;&gt; --remove-section=3D.note<br>
&gt;&gt; &#39;/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux=
-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi&#39;<br=
>
&gt;&gt; DEBUG: Python function split_and_strip_files finished<br>
&gt;&gt; DEBUG: Executing python function fixup_perms<br>
&gt;&gt; DEBUG: Python function fixup_perms finished<br>
&gt;&gt; DEBUG: Executing python function package_do_split_locales<br>
&gt;&gt; DEBUG: No locale files in this package<br>
&gt;&gt; DEBUG: Python function package_do_split_locales finished<br>
&gt;&gt; DEBUG: Executing python function populate_packages<br>
&gt;&gt; DEBUG: Python function populate_packages finished<br>
&gt;&gt; DEBUG: Executing python function do_package_qa<br>
&gt;&gt; NOTE: DO PACKAGE QA<br>
&gt;&gt; NOTE: Checking Package: uwsgi-staticdev<br>
&gt;&gt; NOTE: Checking Package: uwsgi-dev<br>
&gt;&gt; NOTE: Checking Package: uwsgi-dbg<br>
&gt;&gt; NOTE: arm-poky-linux-gnueabi-objdump -p<br>
&gt;&gt; /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnue=
abi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/usr/bin/.=
debug/uwsgi<br>
&gt;&gt; NOTE: Checking Package: uwsgi-doc<br>
&gt;&gt; NOTE: Checking Package: uwsgi<br>
&gt;&gt; NOTE: arm-poky-linux-gnueabi-objdump -p<br>
&gt;&gt; /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnue=
abi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi=
<br>
&gt;&gt; ERROR: QA Issue: package uwsgi contains bad RPATH<br>
&gt;&gt; /media/Build/master/build/tmp/sysroots/duovero/usr/lib in file<br>
&gt;&gt; /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnue=
abi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi=
<br>
&gt;&gt; ERROR: QA run found fatal errors. Please consider fixing them.<br>
&gt;&gt; DEBUG: Python function do_package_qa finished<br>
&gt;&gt; DEBUG: Python function do_package finished<br>
&gt;&gt; ERROR: Function failed: do_package_qa<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>

--bcaec548a1d16ada2d05045f9141--
