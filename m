Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9D15E01481
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 05:22:39 -0700 (PDT)
Received: by mail-ob0-f173.google.com with SMTP id dn14so8154857obc.32
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ilmhyiWgJk56MsPQjBWvES7++jZaPJmVIB7gN2fnzgA=;
	b=oDjRrG8gCbkRxqUzzIpZpahi2uHETV2i/O8ZZMeLbWMxiHTPWzp9WlEqUSnzzBuMqo
	rbboBYVD0ENyYB7tNkXLTcdlPvvyQzg/3JhbmR8aTyxA1Eef6DnypqmWf5qdddpp9Thw
	xuOt7bmTVSKc0RBlCaXs9q0IdvObeb+8Sx9miXsgCcrLTuyFBUmf8eRnQK2krcmpP+BF
	y5/KoaPz+KkBo0sOAgtZao6MjQtMCbBsi5P0g7NBcREQ7wuwfuYnZKl22xpgM3c4CT43
	+AE5iWjLIC1QgK3NUy5zDRFhpNF09+WJnGLLFrmydRFhTivYasW382sUQCSlf0sp7LHS
	ttPg==
MIME-Version: 1.0
X-Received: by 10.60.14.226 with SMTP id s2mr15127251oec.124.1364386959008;
	Wed, 27 Mar 2013 05:22:39 -0700 (PDT)
Received: by 10.60.41.5 with HTTP; Wed, 27 Mar 2013 05:22:38 -0700 (PDT)
Received: by 10.60.41.5 with HTTP; Wed, 27 Mar 2013 05:22:38 -0700 (PDT)
In-Reply-To: <CADkTA4OZYOZfVxGEDJCi22Fk26YnVvWZRwerkSoXr6i5T8GnGw@mail.gmail.com>
References: <1363152493-25261-1-git-send-email-hong-hua.yin@freescale.com>
	<CADkTA4N1wugSgFowPCCyjtcMVeGSrVOHO+CqUwO8KuuKutZ2nw@mail.gmail.com>
	<CADkTA4NSqeasAR7Q4nK_4pVp1uYfF67=zCSZVLJFQECzCn48xA@mail.gmail.com>
	<B5012D5F6E2BBC4DBF16B3E6037A5B732EB3B5@039-SN1MPN1-003.039d.mgd.msft.net>
	<CADkTA4OZYOZfVxGEDJCi22Fk26YnVvWZRwerkSoXr6i5T8GnGw@mail.gmail.com>
Date: Wed, 27 Mar 2013 13:22:38 +0100
Message-ID: <CAAKB1h2HKsboFT=h9HDCC9MnZYz9N5VB4jHE0U_BSwg+KjxaMA@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
	Yin Olivia-R63875 <r63875@freescale.com>
Subject: Re: [PATCH] libvirt: upgrade to 1.0.3
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
X-List-Received-Date: Wed, 27 Mar 2013 12:22:40 -0000
Content-Type: multipart/alternative; boundary=e89a8fb1f9c407284f04d8e718d7

--e89a8fb1f9c407284f04d8e718d7
Content-Type: text/plain; charset=ISO-8859-1

I suggest we create a recipe for a ptest enabled test image to get everyone
using exactly the same tests, and keep everything in the recipes. This will
also allow a standardized test report format.

Br,
David
On Mar 18, 2013 4:33 AM, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

> On Sun, Mar 17, 2013 at 10:49 PM, Yin Olivia-R63875
> <r63875@freescale.com> wrote:
> > Hi Bruce,
> >
> > I can't find any example tests you required.
> >
> > I just ran on FSL PowerPC platforms with QEMU/LXC cases and most domain
> functions worked well.
> >
>
>
> Meaning: start, stop, destroy, migrate for VMs ? And similar tests
> with LXC containers ?
>
> As we get more people using layers and projects associated with the
> Yocto project, we need
> to generate a set of baseline / sanity tests so we can ensure that
> updates don't cause
> regressions.
>
> This is a minor version bump, so I've staged it here, but if you have
> any READMEs,
> scripts or tests steps for this functionality, capturing it in the
> layer for reference would
> help everyone out.
>
> I plan to pull together my own similar docs and contribute them to the
> effort.
>
> Cheers,
>
> Bruce
>
> >
> > Best Regards,
> > Olivia
> >
> >
> >
> > -----Original Message-----
> > From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> > Sent: Friday, March 15, 2013 10:39 PM
> > To: Yin Olivia-R63875
> > Cc: meta-virtualization@yoctoproject.org
> > Subject: Re: [meta-virtualization] [PATCH] libvirt: upgrade to 1.0.3
> >
> > On Wed, Mar 13, 2013 at 6:11 AM, Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> >> On Wed, Mar 13, 2013 at 12:28 AM, Olivia Yin <
> hong-hua.yin@freescale.com> wrote:
> >>> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
> >>
> >> Can you quickly summarize what testing was done with libvirt ? Just so
> >> we can get a feel for the arches that have been covered, and what
> >> functionality has been exercised.
> >>
> >> Since this patch removes the 1.0 version, we won't have a fallback in
> >> tree if things break.
> >
> > ping. There are a few outstanding questions on this. No rush, but I
> didn't want anyone to think we were ignoring or had dropped this series.
> >
> > Cheers,
> >
> > Bruce
> >
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >>> ---
> >>>  .../libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} |    4 ++--
> >>>  1 files changed, 2 insertions(+), 2 deletions(-)  rename
> >>> recipes-extended/libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} (97%)
> >>>
> >>> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb
> >>> b/recipes-extended/libvirt/libvirt_1.0.3.bb
> >>> similarity index 97%
> >>> rename from recipes-extended/libvirt/libvirt_1.0.0.bb
> >>> rename to recipes-extended/libvirt/libvirt_1.0.3.bb
> >>> index 90d7dbb..372e874 100644
> >>> --- a/recipes-extended/libvirt/libvirt_1.0.0.bb
> >>> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> >>> @@ -22,8 +22,8 @@ SRC_URI = "
> http://libvirt.org/sources/libvirt-${PV}.tar.gz \
> >>>         file://libvirtd.sh \
> >>>         file://libvirtd.conf"
> >>>
> >>> -SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
> >>> -SRC_URI[sha256sum] =
> "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
> >>> +SRC_URI[md5sum] = "3d9f85d586c9aa3d819b626622f3fc97"
> >>> +SRC_URI[sha256sum] =
> "f64f4acd7cdcfc6ab5e803195ed58b949f262b54e3659d8c37b33f0fec112757"
> >>>
> >>>  inherit autotools gettext update-rc.d
> >>>
> >>> --
> >>> 1.6.4
> >>>
> >>>
> >>> _______________________________________________
> >>> meta-virtualization mailing list
> >>> meta-virtualization@yoctoproject.org
> >>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> >
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--e89a8fb1f9c407284f04d8e718d7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I suggest we create a recipe for a ptest enabled test image =
to get everyone using exactly the same tests, and keep everything in the re=
cipes. This will also allow a standardized test report format.</p>
<p dir=3D"ltr">Br, <br>
David</p>
<div class=3D"gmail_quote">On Mar 18, 2013 4:33 AM, &quot;Bruce Ashfield&qu=
ot; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.co=
m</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Sun, Mar 17, 2013 at 10:49 PM, Yin Olivia-R63875<br>
&lt;<a href=3D"mailto:r63875@freescale.com">r63875@freescale.com</a>&gt; wr=
ote:<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; I can&#39;t find any example tests you required.<br>
&gt;<br>
&gt; I just ran on FSL PowerPC platforms with QEMU/LXC cases and most domai=
n functions worked well.<br>
&gt;<br>
<br>
<br>
Meaning: start, stop, destroy, migrate for VMs ? And similar tests<br>
with LXC containers ?<br>
<br>
As we get more people using layers and projects associated with the<br>
Yocto project, we need<br>
to generate a set of baseline / sanity tests so we can ensure that<br>
updates don&#39;t cause<br>
regressions.<br>
<br>
This is a minor version bump, so I&#39;ve staged it here, but if you have<b=
r>
any READMEs,<br>
scripts or tests steps for this functionality, capturing it in the<br>
layer for reference would<br>
help everyone out.<br>
<br>
I plan to pull together my own similar docs and contribute them to the effo=
rt.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Best Regards,<br>
&gt; Olivia<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Bruce Ashfield [mailto:<a href=3D"mailto:bruce.ashfield@gmail.co=
m">bruce.ashfield@gmail.com</a>]<br>
&gt; Sent: Friday, March 15, 2013 10:39 PM<br>
&gt; To: Yin Olivia-R63875<br>
&gt; Cc: <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@yoctoproject.org</a><br>
&gt; Subject: Re: [meta-virtualization] [PATCH] libvirt: upgrade to 1.0.3<b=
r>
&gt;<br>
&gt; On Wed, Mar 13, 2013 at 6:11 AM, Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Wed, Mar 13, 2013 at 12:28 AM, Olivia Yin &lt;<a href=3D"mailto=
:hong-hua.yin@freescale.com">hong-hua.yin@freescale.com</a>&gt; wrote:<br>
&gt;&gt;&gt; Signed-off-by: Olivia Yin &lt;<a href=3D"mailto:hong-hua.yin@f=
reescale.com">hong-hua.yin@freescale.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Can you quickly summarize what testing was done with libvirt ? Jus=
t so<br>
&gt;&gt; we can get a feel for the arches that have been covered, and what<=
br>
&gt;&gt; functionality has been exercised.<br>
&gt;&gt;<br>
&gt;&gt; Since this patch removes the 1.0 version, we won&#39;t have a fall=
back in<br>
&gt;&gt; tree if things break.<br>
&gt;<br>
&gt; ping. There are a few outstanding questions on this. No rush, but I di=
dn&#39;t want anyone to think we were ignoring or had dropped this series.<=
br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; =A0.../libvirt/{<a href=3D"http://libvirt_1.0.0.bb" target=3D"=
_blank">libvirt_1.0.0.bb</a> =3D&gt; <a href=3D"http://libvirt_1.0.3.bb" ta=
rget=3D"_blank">libvirt_1.0.3.bb</a>} | =A0 =A04 ++--<br>
&gt;&gt;&gt; =A01 files changed, 2 insertions(+), 2 deletions(-) =A0rename<=
br>
&gt;&gt;&gt; recipes-extended/libvirt/{<a href=3D"http://libvirt_1.0.0.bb" =
target=3D"_blank">libvirt_1.0.0.bb</a> =3D&gt; <a href=3D"http://libvirt_1.=
0.3.bb" target=3D"_blank">libvirt_1.0.3.bb</a>} (97%)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/recipes-extended/libvirt/<a href=3D"http://libvir=
t_1.0.0.bb" target=3D"_blank">libvirt_1.0.0.bb</a><br>
&gt;&gt;&gt; b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.0.3.bb"=
 target=3D"_blank">libvirt_1.0.3.bb</a><br>
&gt;&gt;&gt; similarity index 97%<br>
&gt;&gt;&gt; rename from recipes-extended/libvirt/<a href=3D"http://libvirt=
_1.0.0.bb" target=3D"_blank">libvirt_1.0.0.bb</a><br>
&gt;&gt;&gt; rename to recipes-extended/libvirt/<a href=3D"http://libvirt_1=
.0.3.bb" target=3D"_blank">libvirt_1.0.3.bb</a><br>
&gt;&gt;&gt; index 90d7dbb..372e874 100644<br>
&gt;&gt;&gt; --- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.0.0=
.bb" target=3D"_blank">libvirt_1.0.0.bb</a><br>
&gt;&gt;&gt; +++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.0.3=
.bb" target=3D"_blank">libvirt_1.0.3.bb</a><br>
&gt;&gt;&gt; @@ -22,8 +22,8 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.=
org/sources/libvirt-${PV}.tar.gz" target=3D"_blank">http://libvirt.org/sour=
ces/libvirt-${PV}.tar.gz</a> \<br>
&gt;&gt;&gt; =A0 =A0 =A0 =A0 file://libvirtd.sh \<br>
&gt;&gt;&gt; =A0 =A0 =A0 =A0 file://libvirtd.conf&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -SRC_URI[md5sum] =3D &quot;7c8b006de7338e30866bb56738803b21&qu=
ot;<br>
&gt;&gt;&gt; -SRC_URI[sha256sum] =3D &quot;14c8a30ebfb939c82cab5f759a95d096=
46b43b4210e45490e92459ae65123076&quot;<br>
&gt;&gt;&gt; +SRC_URI[md5sum] =3D &quot;3d9f85d586c9aa3d819b626622f3fc97&qu=
ot;<br>
&gt;&gt;&gt; +SRC_URI[sha256sum] =3D &quot;f64f4acd7cdcfc6ab5e803195ed58b94=
9f262b54e3659d8c37b33f0fec112757&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =A0inherit autotools gettext update-rc.d<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 1.6.4<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-v=
irtualization@yoctoproject.org</a><br>
&gt;&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtua=
lization" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-vi=
rtualization</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await<br>
&gt;&gt; thee at its end&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its end&quot;<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</blockquote></div>

--e89a8fb1f9c407284f04d8e718d7--
