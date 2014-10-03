Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B698E00875; Thu,  2 Oct 2014 19:07:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C406E0076C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Oct 2014 19:07:22 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id z12so260481lbi.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 Oct 2014 19:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PY5KZm6qAxyvxhlvmID9v+vGDsmQNfVIiKx0TaBEnvY=;
	b=gd5BTXApI7a4J8blflW2soUjVpRaIAwNwqluZ8oWEgABwJkO3yz7WmLktOelcqL2Ba
	IqyOawa+8dkqWAn7KbP+Lov695sH70uOMdVAF5yWqtMMqPw5a2K6I8GA3E4MdyOgGlBA
	EisTQZDBRvuH4hMcJZ+zfJMOktw0RqI0txi24/RlLU2JC7kRioPi2ObqlQN4gV6/JbTZ
	ellcq2J/+5YjMAb4lMgsjt8L+Zp+dd8KCgzNgB74zXdVAx7IhECvTs30MlvSc/uBGnRc
	qs/OpgKcpo5r++KHbzJN8/7ULqn9xw5L1Cjc0fhdyxn+4v21tD5WFCwKzt5oELwmslpo
	a1IQ==
MIME-Version: 1.0
X-Received: by 10.152.3.35 with SMTP id 3mr2384436laz.5.1412302041378; Thu, 02
	Oct 2014 19:07:21 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Thu, 2 Oct 2014 19:07:21 -0700 (PDT)
In-Reply-To: <CAFeBWL4hYTf8kGgzwxvLCH5rAd=nRg9SKDCHWM2MwOnr5ng7_g@mail.gmail.com>
References: <CAFeBWL5qa-SEyJ-cwup-PLHszx0X+yy9aKOjCneis7fm5zJtYw@mail.gmail.com>
	<CADkTA4Mu5hZz5Y4HTopSH46iBe4je=Hs899Fm13yrsJMnXkFNg@mail.gmail.com>
	<CAFeBWL7WnEY=WMUvz508mKhiJj5NC3veckuQxPYAhnMMsHfLmw@mail.gmail.com>
	<CADkTA4MSNGX2Lf0sL3x5YxPNZE3bHpYFFjEVeupjagQoXBi=pw@mail.gmail.com>
	<CAFeBWL7+YWR6GjdSpVmoxGy-=E6o3Ocnw=-YheR8by=CHTOgRg@mail.gmail.com>
	<CAFeBWL4hYTf8kGgzwxvLCH5rAd=nRg9SKDCHWM2MwOnr5ng7_g@mail.gmail.com>
Date: Thu, 2 Oct 2014 22:07:21 -0400
Message-ID: <CADkTA4OS5TKTafbDQ8QHL7yyGaz3YDHA+jk9L8p1EDChipcw8A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
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
X-List-Received-Date: Fri, 03 Oct 2014 02:07:32 -0000
Content-Type: multipart/alternative; boundary=089e0141a0107df6d905047b3185

--089e0141a0107df6d905047b3185
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 2, 2014 at 1:39 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> I just tried building uwsgi with qumux86 target. It built ok.
>


And to answer the previous question, I build and use 64bit x86. non x86 is
only
lightly tested, so patches may be required.

The rpath problem is relatively generic to an arch, and if you look at
oe-core,
you'll see examples of some workarounds and fixes.

Cheers,

Bruce


> There must be something different and/or wrong in the machine
> configuration for my embedded board (TI OMAP4 platform).
>
> I will keep digging, but if anyone has insight, it will be appreciated!
>
> Adam
>
> On Thu, Oct 2, 2014 at 10:01 AM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>
>> Thanks Bruce, I appreciate your help on this.
>>
>> May I get your target also (MACHINE)?
>>
>> Regards,
>>
>> Adam
>>
>> On Wed, Oct 1, 2014 at 10:34 AM, Bruce Ashfield <bruce.ashfield@gmail.com
>> > wrote:
>>
>>> On Wed, Oct 1, 2014 at 1:09 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>>> > Thanks Bruce, can I have some information about your setup? Yocto
>>> version,
>>> > layers involved?
>>> >
>>> > I appreciate it!
>>>
>>> I'm always building the HEAD of pretty much everything, since that's
>>> where I
>>> do all the development.
>>>
>>> So in my case:
>>>
>>> meta
>>>
>>> meta-yocto
>>>
>>> meta-yocto-bsp    = "master:d6da1f78cbf29c6c9ee3e0857a403e53daed256e"
>>>
>>> meta-kernel-dev   = "master:7235853e3d88ace1d4a8784ba533e676a0e74edd"
>>>
>>> meta-virtualization = "master:f5d690a773052c3406936d7e0f2e6af6b24c77c2"
>>>
>>> meta-networking
>>>
>>> meta-filesystems
>>>
>>> meta-webserver
>>>
>>> meta-python
>>>
>>> meta-oe
>>>
>>> meta-ruby         = "master:28e26a9b0ad37d0c92ba42b2727215eef1edf5a2"
>>>
>>> meta-cloud-services
>>>
>>> meta-openstack-controller-deploy
>>>
>>> meta-openstack
>>>
>>> meta-openstack-qemu = "master:d8c7fe8aa19b28249e50ea69127c392743d028dd"
>>>
>>> Bruce
>>>
>>>
>>> >
>>> > Adam
>>> >
>>> > On Tue, Sep 30, 2014 at 10:02 PM, Bruce Ashfield <
>>> bruce.ashfield@gmail.com>
>>> > wrote:
>>> >>
>>> >> On Tue, Sep 30, 2014 at 6:43 PM, Adam Lee <adam.yh.lee@gmail.com>
>>> wrote:
>>> >> > Hello everyone, I am building uwsgi as a part of my image to run a
>>> web
>>> >> > application on my embedded board.
>>> >> >
>>> >> > Ingredients including nginx builds fine, but I am getting the error
>>> >> > attached. I am building on Yocto Project 1.6.1 (current master).
>>> >>
>>> >> Hmmm. I just did a completely clean build and didn't get any QA errors
>>> >> with
>>> >> respect to rpath.
>>> >>
>>> >> Hopefully someone else is seeing this and can help isolate the issue.
>>> >>
>>> >> Bruce
>>> >>
>>> >> >
>>> >> > Any insight will be greatly appreciated!
>>> >> >
>>> >> > Adam
>>> >> >
>>> >> >> DEBUG: Executing python function sstate_task_prefunc
>>> >> >> DEBUG: Python function sstate_task_prefunc finished
>>> >> >> DEBUG: Executing python function do_package
>>> >> >> DEBUG: Executing python function package_get_auto_pr
>>> >> >> DEBUG: Python function package_get_auto_pr finished
>>> >> >> DEBUG: Executing python function perform_packagecopy
>>> >> >> DEBUG: Python function perform_packagecopy finished
>>> >> >> DEBUG: Executing python function split_and_strip_files
>>> >> >> DEBUG: runstrip: 'arm-poky-linux-gnueabi-strip'
>>> >> >> --remove-section=.comment
>>> >> >> --remove-section=.note
>>> >> >>
>>> >> >>
>>> '/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi'
>>> >> >> DEBUG: Python function split_and_strip_files finished
>>> >> >> DEBUG: Executing python function fixup_perms
>>> >> >> DEBUG: Python function fixup_perms finished
>>> >> >> DEBUG: Executing python function package_do_split_locales
>>> >> >> DEBUG: No locale files in this package
>>> >> >> DEBUG: Python function package_do_split_locales finished
>>> >> >> DEBUG: Executing python function populate_packages
>>> >> >> DEBUG: Python function populate_packages finished
>>> >> >> DEBUG: Executing python function do_package_qa
>>> >> >> NOTE: DO PACKAGE QA
>>> >> >> NOTE: Checking Package: uwsgi-staticdev
>>> >> >> NOTE: Checking Package: uwsgi-dev
>>> >> >> NOTE: Checking Package: uwsgi-dbg
>>> >> >> NOTE: arm-poky-linux-gnueabi-objdump -p
>>> >> >>
>>> >> >>
>>> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/usr/bin/.debug/uwsgi
>>> >> >> NOTE: Checking Package: uwsgi-doc
>>> >> >> NOTE: Checking Package: uwsgi
>>> >> >> NOTE: arm-poky-linux-gnueabi-objdump -p
>>> >> >>
>>> >> >>
>>> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
>>> >> >> ERROR: QA Issue: package uwsgi contains bad RPATH
>>> >> >> /media/Build/master/build/tmp/sysroots/duovero/usr/lib in file
>>> >> >>
>>> >> >>
>>> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
>>> >> >> ERROR: QA run found fatal errors. Please consider fixing them.
>>> >> >> DEBUG: Python function do_package_qa finished
>>> >> >> DEBUG: Python function do_package finished
>>> >> >> ERROR: Function failed: do_package_qa
>>> >> >
>>> >> >
>>> >> >
>>> >> > --
>>> >> > _______________________________________________
>>> >> > meta-virtualization mailing list
>>> >> > meta-virtualization@yoctoproject.org
>>> >> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>> >> >
>>> >>
>>> >>
>>> >>
>>> >> --
>>> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> >> thee at its end"
>>> >
>>> >
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>
>>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--089e0141a0107df6d905047b3185
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Oct 2, 2014 at 1:39 PM, Adam Lee <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adam.yh.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I j=
ust tried building uwsgi with qumux86 target. It built ok.=C2=A0</div></blo=
ckquote><div><br></div><div><br></div><div>And to answer the previous quest=
ion, I build and use 64bit x86. non x86 is only</div><div>lightly tested, s=
o patches may be required.</div><div><br></div><div>The rpath problem is re=
latively generic to an arch, and if you look at oe-core,</div><div>you&#39;=
ll see examples of some workarounds and fixes.</div><div><br></div><div>Che=
ers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div>There must be something different and/o=
r wrong in the machine configuration for my embedded board (TI OMAP4 platfo=
rm).</div><div><br></div><div>I will keep digging, but if anyone has insigh=
t, it will be appreciated!</div><span class=3D"HOEnZb"><font color=3D"#8888=
88"><div><br></div><div>Adam</div></font></span></div><div class=3D"HOEnZb"=
><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Thu, Oct 2, 2014 at 10:01 AM, Adam Lee <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adam.yh.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><sp=
an><div dir=3D"ltr" style=3D"font-family:arial,sans-serif;font-size:13px">T=
hanks Bruce, I appreciate your help on this.=C2=A0<div><br></div><div>May I=
 get your target also (MACHINE)?=C2=A0</div><div><br></div><div>Regards,</d=
iv><div><br></div><div>Adam</div></div></span><div style=3D"font-family:ari=
al,sans-serif;font-size:13px"><div><img src=3D"https://ssl.gstatic.com/ui/v=
1/icons/mail/images/cleardot.gif"></div></div></div><div><div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Oct 1, 2014 at 10:34 A=
M, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><span>On Wed, Oct 1, 2014 at 1:09 PM, Adam=
 Lee &lt;<a href=3D"mailto:adam.yh.lee@gmail.com" target=3D"_blank">adam.yh=
.lee@gmail.com</a>&gt; wrote:<br>
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
<span><font color=3D"#888888"><br>
Bruce<br>
</font></span><div><div><br>
<br>
&gt;<br>
&gt; Adam<br>
&gt;<br>
&gt; On Tue, Sep 30, 2014 at 10:02 PM, Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&g=
t;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Sep 30, 2014 at 6:43 PM, Adam Lee &lt;<a href=3D"mailto:ad=
am.yh.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:=
<br>
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
&gt;&gt; &gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" targe=
t=3D"_blank">meta-virtualization@yoctoproject.org</a><br>
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
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--089e0141a0107df6d905047b3185--
