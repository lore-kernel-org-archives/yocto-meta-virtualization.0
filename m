Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F285E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:25:28 -0800 (PST)
Received: by mail-lb0-f170.google.com with SMTP id ge1so804727lbb.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=kKMrFVXHjmTTqUA/q1px89dF2A1V2bPzvC0bgEzLufQ=;
	b=g+x9BSDuv3h/6hQl2ejhGx6HT5IYUJz2tPpBVFyiH89L7BJ87jmn7ejM/4c7m+IFYn
	4pmHaN1map5GX/MvI4EHWztt3NLbYernEVJAMIVHuQ/DHtDWMeF9hNHOnAGFllivPYsz
	k3XaDT8gie4lX9D+BQXJW2M7thGL2445q/Y9hkH+X3tnz2lLRONAFm647CosmEKQHsm2
	bbxoYjKipLcEiIshzl36ZGMI2sSFCmA6TLjK0C8VM7WmJGjR5tR5dRo5o800jtYUDwZd
	lMBNKHoBTJpCOKXj7CMNWy5o9520djFuENv31P3T3cPNw2jiAMRkdzU1SlsaBATJDmHd
	TQrg==
MIME-Version: 1.0
X-Received: by 10.152.109.176 with SMTP id ht16mr1385124lab.2.1359469526573;
	Tue, 29 Jan 2013 06:25:26 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Tue, 29 Jan 2013 06:25:26 -0800 (PST)
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF916722@IRSMSX101.ger.corp.intel.com>
References: <1359464154-16618-1-git-send-email-mihai.prica@intel.com>
	<CADkTA4MVpWpujnuL4wXkHHyz2to9A7Fqg739UPNksYNF1B8XBg@mail.gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF916722@IRSMSX101.ger.corp.intel.com>
Date: Tue, 29 Jan 2013 09:25:26 -0500
Message-ID: <CADkTA4PdzipqHzcXwbLUWPJGO7HFoAnbU_im1n2698i3+J5z_A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Prica, Mihai" <mihai.prica@intel.com>
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
X-List-Received-Date: Tue, 29 Jan 2013 14:25:29 -0000
Content-Type: multipart/alternative; boundary=bcaec54eea2436e32404d46e2aa0

--bcaec54eea2436e32404d46e2aa0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 9:03 AM, Prica, Mihai <mihai.prica@intel.com> wrote=
:

>  *From:* Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> *Sent:* Tuesday, January 29, 2013 3:50 PM
> *To:* Prica, Mihai
> *Cc:* meta-virtualization@yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH V3 1/2] linux-yocto: added
> kernel configuration for KVM****
>
> ** **
>
> On Tue, Jan 29, 2013 at 7:55 AM, Mihai Prica <mihai.prica@intel.com>
> wrote:****
>
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
> @@ -6,3 +6,8 @@ SRC_URI +=3D "file://xt-checksum.scc \
>             file://lxc.scc \
>             "
>
> +KERNEL_FEATURES_append =3D " features/kvm/qemu-kvm-enable"****
>
> ** **
>
> I can always change (and test this on merge), but I think if you double
> check the****
>
> last email on this patch, we want this to be: ****
>
> ** **
>
>    KERNEL_FEATURES_append =3D " features/kvm/qemu-kvm-enable.scc"****
>
> ** **
>
> No need for a v4, I can tweak it on the way in if you agree.****
>
> ** **
>
> Yes, you=92re right. I don=92t know why I missed the scc, I copy-pasted t=
he
> line from the v2 reply. ****
>
> If you could change it that would be great.
>

Done and merged. Much better response time on this version of the series :)

Bruce


> ****
>
> ** **
>
> Thanks,****
>
> Mihai****
>
> ** **
>
> ** **
>
> Cheers,****
>
> ** **
>
> Bruce****
>
>  ****
>
> +
> +module_autoload_kvm =3D "kvm"
> +module_autoload_kvm-amd =3D "kvm-amd"
> +module_autoload_kvm-intel =3D "kvm-intel"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization****
>
>
>
> ****
>
> ** **
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end" ****
>
> ** **
>
> ** **
>
> ** **
>
> ** **
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec54eea2436e32404d46e2aa0
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 29, 2013 at 9:03 AM, Prica, Mihai <span dir=3D"ltr">&lt=
;<a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@int=
el.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">







<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><b><font face=3D"Tahoma"><span style=3D"font-size:10=
.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;font-weight:bold=
">From:</span></font></b><font face=3D"Tahoma"><span style=3D"font-size:10.=
0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
 Bruce Ashfield [mailto:<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>] <br>
<b><span style=3D"font-weight:bold">Sent:</span></b> Tuesday, January 29, 2=
013 3:50 PM<br>
<b><span style=3D"font-weight:bold">To:</span></b> Prica, Mihai<br>
<b><span style=3D"font-weight:bold">Cc:</span></b> <a href=3D"mailto:meta-v=
irtualization@yoctoproject.org" target=3D"_blank">meta-virtualization@yocto=
project.org</a><br>
<b><span style=3D"font-weight:bold">Subject:</span></b> Re: [meta-virtualiz=
ation] [PATCH V3 1/2]
<span>linux-yocto</span>: added kernel configuration for KVM</span></font><=
u></u><u></u></p><div class=3D"im">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><font size=3D"3" face=
=3D"Times New Roman"><span style=3D"font-size:12.0pt"><u></u>=A0<u></u></sp=
an></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">On Tue, Jan 29, 2013 at 7:55 AM, Mihai Prica &lt;<a =
href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@intel.c=
om</a>&gt; wrote:<u></u><u></u></span></font></p>

<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mih=
ai.prica@intel.com" target=3D"_blank">mihai.prica@intel.com</a>&gt;<br>
---<br>
=A0recipes-kernel/<span>linux</span>/linux-yocto_3.4.bbappend | =A0 =A05 ++=
+++<br>
=A01 file changed, 5 insertions(+)<br>
<br>
diff --<span>git</span> a/recipes-kernel/<span>linux</span>/linux-yocto_3.4=
.bbappend b/recipes-kernel/<span>linux</span>/linux-yocto_3.4.bbappend<br>
index 5b163ff..bac7646 100644<br>
--- a/recipes-kernel/<span>linux</span>/linux-yocto_3.4.bbappend<br>
+++ b/recipes-kernel/<span>linux</span>/linux-yocto_3.4.bbappend<br>
@@ -6,3 +6,8 @@ SRC_URI +=3D &quot;<a>file://xt-checksum.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 </a>&quot;<br>
<br>
+<span>KERNEL_FEATURES_append</span> =3D &quot; features/<span>kvm</span>/<=
span>qemu</span>-<span>kvm</span>-enable&quot;<u></u><u></u></span></font><=
/p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><u></u>=A0<u></u></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">I can always change (and test this on merge), but I =
think if you double check the<u></u><u></u></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">last email on this patch, we want this to be:=A0<u><=
/u><u></u></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><u></u>=A0<u></u></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">=A0 =A0<span>KERNEL_FEATURES_append</span> =3D &quot=
; features/<span>kvm</span>/<span>qemu-kvm-enable.scc</span>&quot;<u></u><u=
></u></span></font></p>

<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><u></u>=A0<u></u></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">No need for a v4, I can tweak it on the way in if yo=
u agree.<u></u><u></u></span></font></p>
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d"><u></u>=A0<u></u></span></font></p>
</div><p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span=
 style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif=
&quot;;color:#1f497d">Yes, you=92re right. I don=92t know why I missed the
<span>scc</span>, I copy-pasted the line from the v2 reply. <u></u><u></u><=
/span></font></p>
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d">If you could change it that would be great.</span></font></=
p></div>
</div></blockquote><div><br></div><div style>Done and merged. Much better r=
esponse time on this version of the series :)</div><div style><br></div><di=
v style>Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><div><p class=3D"MsoNorm=
al"><font color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-size:11.0p=
t;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u>=
</u><u></u></span></font></p>

<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d"><u></u>=A0<u></u></span></font></p>
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d">Thanks,<u></u><u></u></span></font></p>
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d">Mihai<u></u><u></u></span></font></p><div class=3D"im">
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d"><u></u>=A0<u></u></span></font></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><u></u>=A0<u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">Cheers,<u></u><u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><u></u>=A0<u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">Bruce<u></u><u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">=A0<u></u><u></u></span></font></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">+<br>
+<span>module_autoload_kvm</span> =3D &quot;<span>kvm</span>&quot;<br>
+<span>module_autoload_kvm-amd</span> =3D &quot;<span>kvm-amd</span>&quot;<=
br>
+<span>module_autoload_kvm-intel</span> =3D &quot;<span>kvm-intel</span>&qu=
ot;<br>
<font color=3D"#888888"><span style=3D"color:#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a></span></font><u></u><u></u></span></font></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><br>
<br clear=3D"all">
<u></u><u></u></span></font></p>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt"><u></u>=A0<u></u></span></font></p>
</div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">--
<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
<u></u><u></u></span></font></p>
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d"><u></u>=A0<u></u></span></font></p>
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d"><u></u>=A0<u></u></span></font></p>
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d"><u></u>=A0<u></u></span></font></p>
<p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Calibri"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:#1f497d"><u></u>=A0<u></u></span></font></p>
</div>
</div>
</div>
</div></div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--bcaec54eea2436e32404d46e2aa0--
