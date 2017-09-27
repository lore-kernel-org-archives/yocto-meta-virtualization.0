Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 389A0E00CF3; Wed, 27 Sep 2017 05:43:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0325BE00C62
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Sep 2017 05:43:12 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id o77so8714469qke.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Sep 2017 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f+1U9qM5tYc2RqmTG1fvx1hdTklwtozDlIv15Kbcfxo=;
	b=rSbmqRjErV48RRN6sU9gA65msYtZ5+xK7hNpPP2xy/LO8dTVsRn2CsXlO7bavqMZxc
	6Stk+k6oqHjp9/YuhDgcizPAyGeiPOoKdsuqUnMBOxv8BEAf7IF//XeTq2vJzbaiNttw
	I+KOHRGo3gtOe4/CaTY3vxtA6Cbw9aFXBCaCLkrpA4iBd47I+rD6xJ1WwtYBNaeCNTGb
	kHf+RCFT7rSTc9ZcHb2dKKljHMR+WsTCAbdLWb5Y4TwH0XMO6uej5UmnSlwTj0uzt3Wr
	AxeUXciHH8Hg8MC21P5/js/sG4IYvCpvsszJYHMH8nU3Pvt4OFNxRkaXl0llbS27kXry
	VcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f+1U9qM5tYc2RqmTG1fvx1hdTklwtozDlIv15Kbcfxo=;
	b=a/cc54xQmL3ZC8c45V7yjKCz0TvXsFgVelBcMyXRjtlM5DzFU5kGTWiYya+StUnbRI
	xT1MbRkH/fE5gHxG9723iLZidEFbD2UdtNFDD9IRqNxKRjYM6X+LEJb3oQEszMxCr9Ux
	Ap4CfP4evB6T+fqmvWQnxzDa8/wUIPaNH3RuJAupxcRPcUQoMo5VeAE+J+QWgKtpJ5iv
	LEnarSij7l3nttKWsJERq3ZUJhXg5QfN1MXRZ7nRgA6gMGiUm/zshSjDkUv1k1HzMCRp
	4vJoPHJ41l3YK2QW4UMhFdPdAQSJiqqwOJRIGwMHyG5ckckVe11UtQHBRZJW6oqdy3Jj
	wGfw==
X-Gm-Message-State: AHPjjUgm4OE6Sr9YJ19O0jSQgsku1jF8d7wxW/+nzg5/uTK8CoTtXh8P
	iVvKvIShCpKiGWpQ4Vm33ByXGjbAyfWufTHWKks=
X-Google-Smtp-Source: AOwi7QBplFc3mT+TwAR59t6+iD7iCLvEHc9+CIvsVjOn8MoOgraUxlRG/6zu0yJWw8f86qm2f4xGyh9PPsOURQqrFAw=
X-Received: by 10.55.109.66 with SMTP id i63mr1892139qkc.19.1506516192202;
	Wed, 27 Sep 2017 05:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Wed, 27 Sep 2017 05:43:11 -0700 (PDT)
In-Reply-To: <CACMJ4Gawh22qtGgedcpZbkOC2=MM7fQHFT5MV-v26gbxWe=BeA@mail.gmail.com>
References: <20170926033105.15731-1-Qi.Chen@windriver.com>
	<20170926033105.15731-2-Qi.Chen@windriver.com>
	<CACMJ4Gawh22qtGgedcpZbkOC2=MM7fQHFT5MV-v26gbxWe=BeA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 Sep 2017 08:43:11 -0400
Message-ID: <CADkTA4OTUxuz4BX4ZssAJptoapkHO9GMW83C6pVgFM=JTuLAsA@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V3 2/3] linux-yocto: make bbappend have effect conditionally
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
X-List-Received-Date: Wed, 27 Sep 2017 12:43:14 -0000
Content-Type: multipart/alternative; boundary="94eb2c05c2a67c14cc055a2b22d3"

--94eb2c05c2a67c14cc055a2b22d3
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 4:57 PM, Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> On Mon, Sep 25, 2017 at 8:31 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> > Make these bbappend files to take effect only when DISTRO_FEATURES
> > contain 'virtualization'. Otherwise, we would meet failure failure
> > at system booting up qemux86. Related logs are as below.
> >
> >  systemd-modules-load[113]: Failed to insert 'kvm_amd': Operation not
> supported
> >  systemd-modules-load[113]: Failed to insert 'kvm_intel': Operation not
> supported
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ...
> > diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc
> b/recipes-kernel/linux/linux-yocto_virtualization.inc
> > new file mode 100644
> > index 0000000..8b296d7
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> > @@ -0,0 +1,20 @@
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto:"
> > +
> > +SRC_URI += "file://xt-checksum.scc \
> > +            file://ebtables.scc \
> > +           file://vswitch.scc \
> > +           file://lxc.scc \
> > +            file://docker.scc \
> > +           "
> > +KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> > +
> > +KERNEL_MODULE_AUTOLOAD += "openvswitch"
> > +KERNEL_MODULE_AUTOLOAD += "kvm"
> > +KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> > +KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> > +
> > +# aufs kernel support required for xen-image-minimal
> > +KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> > +
> > +# xen kernel support
> > +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> > --
> > 2.11.0
> >
> > --
>
> Suggestion for a preferred change: make the KVM features depend on
> DISTRO_FEATURES containing 'kvm', in the same way that the Xen
> features do for DISTRO_FEATURES containing 'xen'.
>
> Here's why: those KVM kernel modules are not of interest on Xen
> systems. With this change, you're removing the KVM features from the
> qemu build to solve your bug in hand, by making it conditional on
> 'virtualization', but is still leaves them present when only Xen is
> needed.
>
> With that change, I'm not sure whether a 'virtualization' disto
> feature is immediately useful. It could make sense for features that
> are hypervisor-agnostic but I don't have an immediate example to point
> to.
>

I like the suggestion as well. I'd like to future proof this a bit, and we
should keep the
virtualization feature around, but make the KVM features depend on kvm in
the
DISTRO_FEATURES. Less churn on distro flags is a good thing.

Chen Qi, can you rework the check and warning message to reflect that 'kvm'
is the distro feature to set ?

Bruce




>
> Christopher
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05c2a67c14cc055a2b22d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Sep 26, 2017 at 4:57 PM, Christopher Clark <span dir=3D"ltr">&l=
t;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">christ=
opher.w.clark@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D"">On Mon, Sep 25, 2017 at 8:31 PM, Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>
&gt; Make these bbappend files to take effect only when DISTRO_FEATURES<br>
&gt; contain &#39;virtualization&#39;. Otherwise, we would meet failure fai=
lure<br>
&gt; at system booting up qemux86. Related logs are as below.<br>
&gt;<br>
&gt;=C2=A0 systemd-modules-load[113]: Failed to insert &#39;kvm_amd&#39;: O=
peration not supported<br>
&gt;=C2=A0 systemd-modules-load[113]: Failed to insert &#39;kvm_intel&#39;:=
 Operation not supported<br>
&gt;<br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi=
.Chen@windriver.com</a>&gt;<br>
</span>...<br>
<div><div class=3D"h5">&gt; diff --git a/recipes-kernel/linux/linux-<wbr>yo=
cto_virtualization.inc b/recipes-kernel/linux/linux-<wbr>yocto_virtualizati=
on.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..8b296d7<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-<wbr>yocto_virtualization.inc<br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/linux-yocto:&quot;<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ebtables.scc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vswitch.scc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc.scc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
&gt; +<br>
&gt; +KERNEL_MODULE_AUTOLOAD +=3D &quot;openvswitch&quot;<br>
&gt; +KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm&quot;<br>
&gt; +KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
&gt; +KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
&gt; +<br>
&gt; +# aufs kernel support required for xen-image-minimal<br>
&gt; +KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<w=
br>FEATURES&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;<=
wbr>, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +# xen kernel support<br>
&gt; +SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39=
;, &#39;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
&gt; --<br>
<br>
</div></div>Suggestion for a preferred change: make the KVM features depend=
 on<br>
DISTRO_FEATURES containing &#39;kvm&#39;, in the same way that the Xen<br>
features do for DISTRO_FEATURES containing &#39;xen&#39;.<br>
<br>
Here&#39;s why: those KVM kernel modules are not of interest on Xen<br>
systems. With this change, you&#39;re removing the KVM features from the<br=
>
qemu build to solve your bug in hand, by making it conditional on<br>
&#39;virtualization&#39;, but is still leaves them present when only Xen is=
<br>
needed.<br>
<br>
With that change, I&#39;m not sure whether a &#39;virtualization&#39; disto=
<br>
feature is immediately useful. It could make sense for features that<br>
are hypervisor-agnostic but I don&#39;t have an immediate example to point<=
br>
to.<br></blockquote><div><br></div><div>I like the suggestion as well. I&#3=
9;d like to future proof this a bit, and we should keep the</div><div>virtu=
alization feature around, but make the KVM features depend on kvm in the</d=
iv><div>DISTRO_FEATURES. Less churn on distro flags is a good thing.</div><=
div><br></div><div>Chen Qi, can you rework the check and warning message to=
 reflect that &#39;kvm&#39;</div><div>is the distro feature to set ?</div><=
div><br></div><div>Bruce</div><div><br></div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Christopher<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--94eb2c05c2a67c14cc055a2b22d3--
