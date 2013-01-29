Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77B76E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:49:49 -0800 (PST)
Received: by mail-lb0-f177.google.com with SMTP id go11so734322lbb.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Y2B3fszN9rZkB3L6V2mIT8BcVtmbuNYXRMViDQg1cc8=;
	b=jxyFBrONoLHbYrh7JViNNI6V/i8PAL3Qr44j0xGRdQbZF7mZzISuwxcdWIUppvJnAG
	U0i50yaNriTnqos3Gx1bAiEubBgsmGUjuNuLqwYkiVZXFAVSAc2QbLzBdqxSbKbkTW5H
	1cEtmsJHCqUgKqo9A7qhDxNL+tMunicodgpNaAidKG8Jkdd1DbrxKWF6a14V14HRjUiQ
	CFk4TCUJ14K7W3eQg/BSPe16NOq15FOc28QD0/KmmZCmw0K/6NteZqy/8GMibEHchhuq
	OKj8sgNuK+gfFU6U+Vi7/DkU9Pxxb2me+8XbW5iSP+XXQf6liwg6Yn3NGQ/e8ZMjyECr
	NNyA==
MIME-Version: 1.0
X-Received: by 10.152.162.1 with SMTP id xw1mr1271140lab.3.1359467388303; Tue,
	29 Jan 2013 05:49:48 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Tue, 29 Jan 2013 05:49:48 -0800 (PST)
In-Reply-To: <1359464154-16618-1-git-send-email-mihai.prica@intel.com>
References: <1359464154-16618-1-git-send-email-mihai.prica@intel.com>
Date: Tue, 29 Jan 2013 08:49:48 -0500
Message-ID: <CADkTA4MVpWpujnuL4wXkHHyz2to9A7Fqg739UPNksYNF1B8XBg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V3 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Tue, 29 Jan 2013 13:49:49 -0000
Content-Type: multipart/alternative; boundary=f46d042ef4a5c3785704d46daa6c

--f46d042ef4a5c3785704d46daa6c
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 29, 2013 at 7:55 AM, Mihai Prica <mihai.prica@intel.com> wrote:

> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 5b163ff..bac7646 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -6,3 +6,8 @@ SRC_URI += "file://xt-checksum.scc \
>             file://lxc.scc \
>             "
>
> +KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable"
>

I can always change (and test this on merge), but I think if you double
check the
last email on this patch, we want this to be:

   KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"

No need for a v4, I can tweak it on the way in if you agree.

Cheers,

Bruce


> +
> +module_autoload_kvm = "kvm"
> +module_autoload_kvm-amd = "kvm-amd"
> +module_autoload_kvm-intel = "kvm-intel"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d042ef4a5c3785704d46daa6c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 29, 2013 at 7:55 AM, Mihai Prica <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@inte=
l.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.pri=
ca@intel.com">mihai.prica@intel.com</a>&gt;<br>

---<br>
=A0recipes-kernel/linux/linux-yocto_3.4.bbappend | =A0 =A05 +++++<br>
=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend<br>
index 5b163ff..bac7646 100644<br>
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
@@ -6,3 +6,8 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
<br>
+KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable&quot;<br></=
blockquote><div><br></div><div style>I can always change (and test this on =
merge), but I think if you double check the</div><div style>last email on t=
his patch, we want this to be:=A0</div>
<div style><br></div><div style>=A0 =A0KERNEL_FEATURES_append =3D &quot; fe=
atures/kvm/qemu-kvm-enable.scc&quot;</div><div style><br></div><div style>N=
o need for a v4, I can tweak it on the way in if you agree.</div><div style=
><br>
</div><div style>Cheers,</div><div style><br></div><div style>Bruce</div><d=
iv>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">

+<br>
+module_autoload_kvm =3D &quot;kvm&quot;<br>
+module_autoload_kvm-amd =3D &quot;kvm-amd&quot;<br>
+module_autoload_kvm-intel =3D &quot;kvm-intel&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div></div>

--f46d042ef4a5c3785704d46daa6c--
