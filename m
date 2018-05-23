Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFA92E00A6A; Wed, 23 May 2018 11:15:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AD0AE009C8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 11:15:33 -0700 (PDT)
Received: by mail-wr0-f193.google.com with SMTP id j1-v6so17212696wrm.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1jxXp+O/t333+Fpe6SsQTObiZwruPUan1ES+SGI56xQ=;
	b=Vr0aH/GyATtH1SQ4UnmME8ikA6hkbE9Uf65fhRgiu1HJ1ETpZ40OHMLJcqoFwFXVdk
	sEYlZBWQd0JAg2zMoMKljOZ8BaGWX/f07YuOv27oM4xxqKbmIL3X6UOTRZig+sCTWeoJ
	ot1z73TCjh7jolVDHp6rMJ492STQZ3FIyYKBigKeWqfzqg8FZS/dDLAHqY9xCUIzJc2D
	jrxsLJi8APPH2DB72WOwjb0MXRGHvpg+qdIfUrRczFnPueLahGlLjs6X/qQMom1n3EWL
	bCboLJJbyIeSY3tToqP6AR8fqG7jPRiHM6PlaskQvWbcncWRVVGMv4W/4jlFn3yIcdhC
	3awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1jxXp+O/t333+Fpe6SsQTObiZwruPUan1ES+SGI56xQ=;
	b=Z1qNyHYAtDojLbt/tHCWxn3QEIgljuU5dX3XF1Dc/de/9AHmu/JGJpQ1CGVpf2DGbY
	UDn2YZF1FIjBQlj4SwA3/W5fWvM0H46YctNvtEQoQ4taSjm4GROCPdb3Kx599EfQWMzD
	zFM7+qn/VUa3hCN7z5m1yICSc7C3TYDgvI9zbmA7kx4Chcxo2vDdPAQz0lsNRa99LmDq
	o9boUlXJqYuzcxYglhpuhOYj5qoKpFbkmPYvpeRBp1zcZ7uvs6lBbVirZqGzoXvL4HSd
	W5dtGl16VRS05j5UqouXImPoojrMdybVnAg7rtWl9CpGvh+mqe2JVsHAV8WKfTZQyIZe
	JTOg==
X-Gm-Message-State: ALKqPwecUBoGvvWSK8ZYwbvCADqn0JLplZtnz8ZujxI+35WMr/Hpl7kw
	3gu2SeOtQASCBzxOrLM1RNkkCCdnli8G3UfJJ4CtSA==
X-Google-Smtp-Source: AB8JxZpVxn+L9YyaRWYPUFBC4401VBv/uvL60uyrjbaBYAq4AaUReZPYtRlK9cwXJk1Gxx6XOSN+Bucjkqtp/4n1h7g=
X-Received: by 2002:a19:a2c2:: with SMTP id
	l185-v6mr2343882lfe.135.1527099332329; 
	Wed, 23 May 2018 11:15:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Wed, 23 May 2018 11:15:31 -0700 (PDT)
In-Reply-To: <trinity-1641f8e9-1faa-4cb2-8cc2-99d2377a8751-1527074397717@3c-app-webde-bap48>
References: <trinity-a3db492f-8222-4da7-866b-d0290300a2c4-1526989134941@3c-app-webde-bap43>
	<CADkTA4OsWJoD5X9DuRZjoYA4aAAQ_qdT0WJSnKoTZGK83ojrQw@mail.gmail.com>
	<trinity-1641f8e9-1faa-4cb2-8cc2-99d2377a8751-1527074397717@3c-app-webde-bap48>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 May 2018 14:15:31 -0400
Message-ID: <CADkTA4MqER7xi56ab-SVnC1AEfXA4pABLT-Pksj1U792CY6ajg@mail.gmail.com>
To: Nicolai Weis <nicolai.weis@web.de>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Question Integration of LXC
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
X-List-Received-Date: Wed, 23 May 2018 18:15:34 -0000
Content-Type: multipart/alternative; boundary="0000000000003d8b67056ce3859f"

--0000000000003d8b67056ce3859f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2018 at 7:19 AM, Nicolai Weis <nicolai.weis@web.de> wrote:

> On Tue, May 22, 2018 at 7:38 AM, Nicolai Weis <nicolai.weis at web.de <ht=
tps://lists.yoctoproject.org/listinfo/meta-virtualization>> wrote:
>
> > >* Hi all,
> *> >> >* In a project I want to integrate lxc-containers into the
> *> >* core-image-minimal for the minnowboard turbot. Therefore I'm using =
the
> *> >* krogoth branch (have to use this branch) for the meta-layers.
> *> >* As described in the README-file I add meta-virtualization, meta-oe,
> *> >* meta-networking, meta-filesystems and meta-python to the bblayers.c=
onf. In
> *> >* the local.conf
> *> >* I added at the end of the file BBFILE_PRIORITY_openembedded-layer =
=3D "4"
> *> >* and IMAGE_INSTALL_append =3D " lxc" (lxc_2.0.0.bb <http://lxc_2.0.0=
.bb>).
> *> >> >* After the sucessful build I start the image and created with the
> *> >* busybox-template - should I use a different template? - a lxc-busyb=
ox
> *> >* container. I tried to start the container, but the error
> *> >* "1079 failed initializing cgroup support" appeared. lxc-checkconfig=
 showed
> *> >* cgroup-namespaces: required. I tried to solve this with adding cgro=
up-lite
> *> >* to IMAGE_INSTALL_append, but it
> *> >* didn't change anything (only let cgroup-namespaces disappear and sh=
owed
> *> >* Cgroup clone_children flag: enabled). I'm using sysvinit instead of=
 systemd.
> *> What kernel are you using ? This typically means that the kernel confi=
g
> > isn't correct.
> > If you aren't using linux-yocto, then the fragments we have in the laye=
r
> > are likely
> > not being applied, and you'll need to manually configure your kernel wi=
th
> > the right
> >
> options.
>
> In the minnowboard image I'm using the kernel version 4.4.26-rt19-yocto-p=
reempt-rt.
> I tried it with a qemux image with the kernel version 4.4.26-yocto-standa=
rd, too.
>
>
You are fine with both of these kernels. I know that we've run LXC against
them in the past

> > Otherwise, it could be that the cgroups are not being mounted properly =
by
> > your
> > recipe, so have a look and confirm if cgroups or cgroups2 are in fact
> > mounted in
> > your image.
>
> I did the mounting with the cgroups-mount script under the /bin directory=
 (comming through adding cgroups-lite to the image). Inside /sys/fs/cgroup =
directory
> there are the mounted folders with blkio, cpu, cpuacct, cpuset, debug, de=
vices, freezer, memory and net_cls. Furthermore I checked it with a cgroups=
_check-config.sh from docker.
> The output showed following missing configs, but I don't think they are t=
he reason that the lxc-busybox container doesn't start:
> - Generally necessary - missing: CONFIG_VETH, CONFIG_IP_NF_TARGET_MASQUER=
ADE, CONFIG_NETFILTER_XT_MATCH_ADDRTYPE, CONFIG_NETFILTER_XT_MATCH_IPVS, CO=
NFIG_IP_NF_NAT,
>    CONFIG_DEVPTS_MULTIPLE_INSTANCES
> - Optional Features - missing: CONFIG_CGROUP_PIDS, CONFIG_BLK_DEV_THROTTL=
ING, CONFIG_CFQ_GROUP_IOSCHED, CONFIG_CGROUP_PERF, CONFIG_CGROUP_HUGETLB, C=
ONFIG_CGROUP_NET_PRIO,
>   CONFIG_CFS_BANDWIDTH, CONFIG_RT_GROUP_SCHED, CONFIG_IP_VS, CONFIG_IP_VS=
_NFCT, CONFIG_IP_VS_RR
>
> With lxc-start -n Test -F it showed that start.c: 1079 failed initializin=
g cgroup support comes after cgfsng.c: 431 no systemd controller mountpoint=
 found. If I try to mount systemd (I'm using sysvinit and so mounting syste=
md makes no sense to me) there are a lot of other failures.
>
>
Both lxc and docker have over time evolved to have very specific
expectations of mounts (and in particular cgroup mounts), which is made
worse with the versions moving from cgroup to cgroup2 mount structures.

It could also just be that our sysvinit support has bit-rotted. I know that
I've been using systemd for quite a long time and haven't heard of a lot of
sysvinit testing.

My suggestion is that we need to dive into the code to see what mount
structure that LXC version is looking for, and then figure out how to
manually mount it (which I've done in the past), or get cgroups-lite to
take care of it.

Bruce

> Bruce
>
>
> > >* Do I have to change some configurations in the lxc-recipe? I would b=
e very
> *> >* grateful if you can give me some information about it.
> *> >> >* Thanks
> *> >* Nicolai*
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--0000000000003d8b67056ce3859f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 23, 2018 at 7:19 AM, Nicolai Weis <span dir=3D"ltr">&lt;<a =
href=3D"mailto:nicolai.weis@web.de" target=3D"_blank">nicolai.weis@web.de</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div style=3D"f=
ont-family:Verdana;font-size:12.0px"><div>
<div>
<pre><div><div class=3D"m_-1284139186389913757h5">On Tue, May 22, 2018 at 7=
:38 AM, Nicolai Weis &lt;<a href=3D"https://lists.yoctoproject.org/listinfo=
/meta-virtualization" target=3D"_blank">nicolai.weis at web.de</a>&gt; wrot=
e:

&gt;<i> </i>&gt;<i> Hi all,
</i>&gt;<i> </i>&gt;<i>
</i>&gt;<i> </i>&gt;<i> In a project I want to integrate lxc-containers int=
o the
</i>&gt;<i> </i>&gt;<i> core-image-minimal for the minnowboard turbot. Ther=
efore I&#39;m using the
</i>&gt;<i> </i>&gt;<i> krogoth branch (have to use this branch) for the me=
ta-layers.
</i>&gt;<i> </i>&gt;<i> As described in the README-file I add meta-virtuali=
zation, meta-oe,
</i>&gt;<i> </i>&gt;<i> meta-networking, meta-filesystems and meta-python t=
o the bblayers.conf. In
</i>&gt;<i> </i>&gt;<i> the local.conf
</i>&gt;<i> </i>&gt;<i> I added at the end of the file BBFILE_PRIORITY_open=
embedded-l<wbr>ayer =3D &quot;4&quot;
</i>&gt;<i> </i>&gt;<i> and IMAGE_INSTALL_append =3D &quot; lxc&quot; (<a h=
ref=3D"http://lxc_2.0.0.bb" target=3D"_blank">lxc_2.0.0.bb</a>).
</i>&gt;<i> </i>&gt;<i>
</i>&gt;<i> </i>&gt;<i> After the sucessful build I start the image and cre=
ated with the
</i>&gt;<i> </i>&gt;<i> busybox-template - should I use a different templat=
e? - a lxc-busybox
</i>&gt;<i> </i>&gt;<i> container. I tried to start the container, but the =
error
</i>&gt;<i> </i>&gt;<i> &quot;1079 failed initializing cgroup support&quot;=
 appeared. lxc-checkconfig showed
</i>&gt;<i> </i>&gt;<i> cgroup-namespaces: required. I tried to solve this =
with adding cgroup-lite
</i>&gt;<i> </i>&gt;<i> to IMAGE_INSTALL_append, but it
</i>&gt;<i> </i>&gt;<i> didn&#39;t change anything (only let cgroup-namespa=
ces disappear and showed
</i>&gt;<i> </i>&gt;<i> Cgroup clone_children flag: enabled). I&#39;m using=
 sysvinit instead of systemd.
</i>
<i>
</i>&gt;<i> </i>What kernel are you using ? This typically means that the k=
ernel config
&gt;<i> </i>isn&#39;t correct.
&gt;<i> </i>If you aren&#39;t using linux-yocto, then the fragments we have=
 in the layer
&gt;<i> </i>are likely
&gt;<i> </i>not being applied, and you&#39;ll need to manually configure yo=
ur kernel with
&gt;<i> </i>the right
&gt;<i> </i></div></div>options.

In the minnowboard image I&#39;m using the kernel version 4.4.26-rt19-yocto=
-preempt-rt.
I tried it with a qemux image with the kernel version 4.4.26-yocto-standard=
, too. </pre></div></div></div></div></blockquote><div><br></div><div>You a=
re fine with both of these kernels. I know that we&#39;ve run LXC against t=
hem in the past</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div style=3D"font=
-family:Verdana;font-size:12.0px"><div><div><pre>&gt;<i> </i>Otherwise, it =
could be that the cgroups are not being mounted properly by
&gt;<i> </i>your
&gt;<i> </i>recipe, so have a look and confirm if cgroups or cgroups2 are i=
n fact
&gt;<i> </i>mounted in
&gt;<i> </i>your image.

I did the mounting with the cgroups-mount script under the /bin directory (=
comming through adding cgroups-lite to the image). Inside /sys/fs/cgroup di=
rectory
there are the mounted folders with blkio, cpu, cpuacct, cpuset, debug, devi=
ces, freezer, memory and net_cls. Furthermore I checked it with a cgroups_c=
heck-config.sh from docker.
The output showed following missing configs, but I don&#39;t think they are=
 the reason that the lxc-busybox container doesn&#39;t start:
- Generally necessary - missing: CONFIG_VETH, CONFIG_IP_NF_TARGET_MASQUERAD=
E<wbr>, CONFIG_NETFILTER_XT_MATCH_ADDR<wbr>TYPE, CONFIG_NETFILTER_XT_MATCH_=
IPVS<wbr>, CONFIG_IP_NF_NAT,
=C2=A0=C2=A0 CONFIG_DEVPTS_MULTIPLE_INSTANC<wbr>ES
- Optional Features - missing: CONFIG_CGROUP_PIDS, CONFIG_BLK_DEV_THROTTLIN=
G, CONFIG_CFQ_GROUP_IOSCHED, CONFIG_CGROUP_PERF, CONFIG_CGROUP_HUGETLB, CON=
FIG_CGROUP_NET_PRIO,
=C2=A0 CONFIG_CFS_BANDWIDTH, CONFIG_RT_GROUP_SCHED, CONFIG_IP_VS, CONFIG_IP=
_VS_NFCT, CONFIG_IP_VS_RR

With lxc-start -n Test -F it showed that start.c: 1079 failed initializing =
cgroup support comes after cgfsng.c: 431 no systemd controller mountpoint f=
ound. If I try to mount systemd (I&#39;m using sysvinit and so mounting sys=
temd makes no sense to me) there are a lot of other failures.=20
</pre></div></div></div></div></blockquote><div><br></div><div>Both lxc and=
 docker have over time evolved to have very specific expectations of mounts=
 (and in particular cgroup mounts), which is made worse with the versions m=
oving from cgroup to cgroup2 mount structures.</div><div><br></div><div>It =
could also just be that our sysvinit support has bit-rotted. I know that I&=
#39;ve been using systemd for quite a long time and haven&#39;t heard of a =
lot of sysvinit testing.</div><div><br></div><div>My suggestion is that we =
need to dive into the code to see what mount structure that LXC version is =
looking for, and then figure out how to manually mount it (which I&#39;ve d=
one in the past), or get cgroups-lite to take care of it.</div><div><br></d=
iv><div>Bruce</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><di=
v style=3D"font-family:Verdana;font-size:12.0px"><div><div><pre>&gt;<i> </i=
>Bruce


&gt;<i> </i>&gt;<i> Do I have to change some configurations in the lxc-reci=
pe? I would be very
</i><span>&gt;<i> </i>&gt;<i> grateful if you can give me some information =
about it.
</i>&gt;<i> </i>&gt;<i>
</i>&gt;<i> </i>&gt;<i> Thanks
</i>&gt;<i> </i>&gt;<i> Nicolai</i></span></pre>
</div>
</div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_-1284139186389913757gmail_signature" data-smartmail=3D"gmail_signatur=
e">&quot;Thou shalt not follow the NULL pointer, for chaos and madness awai=
t thee at its end&quot;</div>
</div></div>

--0000000000003d8b67056ce3859f--
