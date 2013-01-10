Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 107F9E006C2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Jan 2013 05:39:54 -0800 (PST)
Received: by mail-lb0-f173.google.com with SMTP id c1so487864lbg.18
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Jan 2013 05:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wdz+2Q54rMZT06o/XI213MrM9a/sXkuMlZBRmhBMaYc=;
	b=zK5XZ/jVB3munGEEV+pOkuO2QrnMguMBsKOrTzNlj633sYhNicDt0RB/H5nsxS1wvt
	opwlDCtB7EWnZODAqUQw4I9LvsnIQElibx6hjYJzfnHBb8l9S5IstL33r3lZMas/O2Mi
	kh/X4uNc6pRJHbQA/KGQlvG7mN7W2erZAB4s5+wQb+0PFyYFgriEu87290/WJmMDBw0F
	TRKIIRQvSFaxeIe4EeSZUdlHV9w4UqAyDJlg4o4oTiv/3JdSWboIUZlka3anpeU0CVbM
	zjpM5UoCnbHI414h50r5XJYXLdisbqpmGQe61AXAKp+NSTjBTJvaA4aoBbKOB689UyKR
	qEzQ==
MIME-Version: 1.0
Received: by 10.152.110.18 with SMTP id hw18mr69320625lab.22.1357825193676;
	Thu, 10 Jan 2013 05:39:53 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Thu, 10 Jan 2013 05:39:53 -0800 (PST)
In-Reply-To: <50EE6E80.1090105@windriver.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
	<50EB053F.2040809@se-eng.com>
	<CADkTA4NfJq0e-Kcg99uotS1O5ny0uQw=VVmKV0yxwwoMxqdNuw@mail.gmail.com>
	<50EB1486.4080901@se-eng.com>
	<97BD068FB200C44AA73C2B641F162ECF8FB2DC@IRSMSX101.ger.corp.intel.com>
	<CADkTA4NXx8pQQcvObPXQjST08BrQMWGZW-d-8kx4S3Mp7iUuOQ@mail.gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF8FB671@IRSMSX101.ger.corp.intel.com>
	<50EE6E80.1090105@windriver.com>
Date: Thu, 10 Jan 2013 08:39:53 -0500
Message-ID: <CADkTA4NboM=FNqsMjiFRwteEJPy4ocg9Z2tfxOD=mSjc=+i56g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lei.yang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Thu, 10 Jan 2013 13:39:55 -0000
Content-Type: multipart/alternative; boundary=bcaec54d4de8560f7204d2ef50ff

--bcaec54d4de8560f7204d2ef50ff
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 2:32 AM, Lei Yang <lei.yang@windriver.com> wrote:

>  On 01/10/2013 03:43 AM, Prica, Mihai wrote:
>
>   On Tue, Jan 8, 2013 at 1:45 PM, Prica, Mihai <mihai.prica@intel.com>
> wrote:****
>
>  ****
>
> I didn=92t know about the configuration fragments from the kernel tree. I=
=92ll
> redo the patch to use those. ****
>
> I see that the .cfg from the kernel tree enables kvm as modules. In this
> situation, I think I need to add an extra RRECOMMENDS with the necessary
> kernel-module-kvm to bring the necessary modules to the sysroot.  Where
> would be the best places to add this, considering there is no specific
> recipe for kvm? I tried to add them to the image recipe but it didn=92t
> worked.****
>
> ** **
>
> ** **
>
> You are presumably going to enable the in tree fragments by appending to
> KERNEL_FEATURES****
>
> in the linux-yocto_3.4.bbappend. Which to me, seems like the right place
> to also add the****
>
> RRECOMMENDS. Or had you tried this and it didn't work for some reason I'm
> missing at the****
>
> moment (it's late here, and I've spent all day hunting autobuilderbreakag=
e) :)
> ****
>
> ** **
>
> It doesn=92t work in the kernel recipe. I=92ve talked with Richard and he=
 said
> PACKAGE_INSTALL_ATTEMPTONLY can ****
>
> be used for this in the image recipe. He said he will add a new
> IMAGE_INSTALL_RECOMMEND option for this. ****
>
> ** **
>
> There is however one more thing. Which is the best way to configure the
> modules to be loaded at boot-time? I****
>
> saw some discussion on the mailing list about update-modules becoming
> obsolete.****
>
> ** **
>
>
> I think "module_autoload_iwlwifi =3D "iwlwifi" " is your choice
>

That's the method that use as well, but it is tied into update-modules. I
remember the
other thread as well, I'll follow up there.

Cheers,

Bruce


>
> Lei
>
>
>
>
>    Thanks,****
>
> Mihai****
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
>   ****
>
> Thanks,****
>
> Mihai****
>
>  ****
>
> *From:*meta-virtualization-bounces@yoctoproject.org [mailto:
> meta-virtualization-bounces@yoctoproject.org] *On Behalf Of *Raymond Dank=
s
> *Sent:* Monday, January 07, 2013 8:32 PM
> *To:* Bruce Ashfield
> *Cc:* meta-virtualization@yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH 1/2] linux-yocto: added
> kernel configuration for KVM****
>
>  ****
>
> On 01/07/2013 11:10 AM, Bruce Ashfield wrote:****
>
>   ****
>
>  ****
>
> On Mon, Jan 7, 2013 at 12:26 PM, Raymond Danks <ray.danks@se-eng.com>
> wrote:****
>
> I'm going to show my lack of knowledge in this area, but I know this is
> going to come up when I push a xen.cfg that I apparently never added.
>
> Is it possible to do something along the lines of PACKAGE_CONFIG in the
> linux-yocto.bbappend?  For example, in the libvirt package one can use
> PACKAGE_CONFIG to construct a "minimal" build of libvirt.  What would be
> the method for one to do the same in this package?****
>
>  ****
>
> kernel configuration fragment use are controlled via the KERNEL_FEATURES
> variable, and****
>
> for anything pre-yocto 1.4 that means an in-tree kernel configuration
> fragment (I'm still pushing****
>
> for the fragments to be maintained in tree, since that allows them to be
> reused and maintained****
>
> more easily).****
>
>  ****
>
> KERNEL_FEATURES is managed like any other variable in the system,
> including updating****
>
> it via optional/dynamic features as we see fit.****
>
>
> Thanks Bruce.  Yes, KERNEL_FEATURES is what I was looking for, I believe.
> I'm seeing some references and examples for this now.
>
> Ray
>
> ****
>
>  ****
>
>
> Yes, I imagine that worst case there can be a SRC_URI_distro definition
> that includes only the .scc files required for that "minimal" image
> build, but it seems like we want to keep away from that as much as possib=
le
> being that this isn't a distro layer.****
>
>   ****
>
> Typically we do this via a base KERNEL_FEATURES specification in the
> relevant recipe(s), and****
>
> distros, or other configurations can override/extend it as required.****
>
>  ****
>
> Cheers,****
>
>  ****
>
> Buce****
>
>  ****
>
> Thanks,
> Ray ****
>
>
>
> On 01/07/2013 05:08 AM, Mihai Prica wrote:****
>
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>   recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
>   recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
>   recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
>   3 files changed, 9 insertions(+)
>   create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
>   create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg
>
> diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.sccb/recipes-ker=
nel/
> linux/linux-yocto/kvm-enable.scc
> new file mode 100644
> index 0000000..0b5f4fc
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable KVM host support"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware kvm.cfg
> diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg b/recipes-kernel/
> linux/linux-yocto/kvm.cfg
> new file mode 100644
> index 0000000..0cfcf58
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/kvm.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_KVM=3Dy
> +CONFIG_KVM_INTEL=3Dy
> +CONFIG_KVM_AMD=3Dy
> +CONFIG_TUN=3Dy
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 5b163ff..71bead2 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -4,5 +4,6 @@ SRC_URI +=3D "file://xt-checksum.scc \
>               file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://kvm-enable.scc \
>             "
>   ****
>
>  ****
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
>  ****
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end" ****
>
>  ****
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
>
> _______________________________________________
> meta-virtualization mailing listmeta-virtualization@yoctoproject.orghttps=
://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec54d4de8560f7204d2ef50ff
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 10, 2013 at 2:32 AM, Lei Yang <span dir=3D"ltr">&lt;<a =
href=3D"mailto:lei.yang@windriver.com" target=3D"_blank">lei.yang@windriver=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div class=3D"im">
    On 01/10/2013 03:43 AM, Prica, Mihai wrote:
    <blockquote type=3D"cite">
     =20
     =20
     =20
     =20
     =20
     =20
     =20
      <div>
        <div>
          <div>
            <div>
              <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font face=
=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">On Tue, Ja=
n 8, 2013 at 1:45
                    PM, Prica, Mihai &lt;<a href=3D"mailto:mihai.prica@inte=
l.com" target=3D"_blank">mihai.prica@intel.com</a>&gt;
                    wrote:<u></u><u></u></span></font></p>
              <div>
                <div>
                  <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font c=
olor=3D"#1f497d" face=3D"Calibri"><span style=3D"font-size:11.0pt;font-fami=
ly:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">=A0</span></fo=
nt><u></u><u></u></p>

                  <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font c=
olor=3D"#1f497d" face=3D"Calibri"><span style=3D"font-size:11.0pt;font-fami=
ly:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">I
                        didn=92t know about the configuration fragments
                        from the kernel tree. I=92ll redo the patch to use
                        those.
                      </span></font><u></u><u></u></p>
                  <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font c=
olor=3D"#1f497d" face=3D"Calibri"><span style=3D"font-size:11.0pt;font-fami=
ly:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">I
                        see that the .<span>cfg</span>
                        from the kernel tree enables
                        <span>kvm</span> as modules. In
                        this situation, I think I need to add an extra
                        RRECOMMENDS with the necessary kernel-module-<span>=
kvm</span> to bring the
                        necessary modules to the
                        <span>sysroot</span>.=A0 Where
                        would be the best places to add this,
                        considering there is no specific recipe for
                        <span>kvm</span>? I tried to add
                        them to the image recipe but it didn=92t worked.</s=
pan></font><u></u><u></u></p>
                </div>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt"><u></u>=
=A0<u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt"><u></u>=
=A0<u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">You are p=
resumably going
                      to enable the in tree fragments by appending to
                      KERNEL_FEATURES<u></u><u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">in the
                      linux-yocto_3.4.bbappend. Which to me, seems like
                      the right place to also add the<u></u><u></u></span><=
/font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">RRECOMMEN=
DS. Or had you
                      tried this and it didn&#39;t work for some reason I&#=
39;m
                      missing at the<u></u><u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">moment (i=
t&#39;s late here,
                      and I&#39;ve spent all day hunting
                      <span>autobuilder</span> breakage)
                      :)<u></u><u></u></span></font></p>
                <p class=3D"MsoNormal"><font color=3D"#1f497d" face=3D"Cali=
bri"><span><u></u>=A0<u></u></span></font></p>
                <p class=3D"MsoNormal"><font face=3D"Calibri"><span>It does=
n=92t work in the kernel
                      recipe. I=92ve talked with Richard and he said
                      PACKAGE_INSTALL_ATTEMPTONLY can <u></u><u></u></span>=
</font></p>
                <p class=3D"MsoNormal"><font face=3D"Calibri"><span>be used=
 for this in the image
                      recipe. He said he will add a new
                      IMAGE_INSTALL_RECOMMEND option for this.
                      <u></u><u></u></span></font></p>
                <p class=3D"MsoNormal"><font face=3D"Calibri"><span><u></u>=
=A0<u></u></span></font></p>
                <p class=3D"MsoNormal"><font face=3D"Calibri"><span>There i=
s however one more thing.
                      Which is the best way to configure the modules to
                      be loaded at boot-time? I<u></u><u></u></span></font>=
</p>
                <p class=3D"MsoNormal"><font face=3D"Calibri"><span>saw som=
e discussion on the
                      mailing list about update-modules becoming
                      obsolete.<u></u><u></u></span></font></p>
                <p class=3D"MsoNormal"><font face=3D"Calibri"><span><u></u>=
=A0<u></u></span></font></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></div>
    I think &quot;module_autoload_iwlwifi =3D &quot;iwlwifi&quot; &quot; is=
 your choice <br></div></blockquote><div><br></div><div style>That&#39;s th=
e method that use as well, but it is tied into update-modules. I remember t=
he</div>
<div style>other thread as well, I&#39;ll follow up there.</div><div style>=
<br></div><div style>Cheers,</div><div style><br></div><div style>Bruce</di=
v><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<div bgcolor=3D"#FFFFFF" text=3D"#000000"><span class=3D"HOEnZb"><font colo=
r=3D"#888888">
    <br>
    Lei</font></span><div><div class=3D"h5"><br>
    =A0<br>
    <br>
    <br>
    <blockquote type=3D"cite">
      <div>
        <div>
          <div>
            <div>
              <div>
                <p class=3D"MsoNormal"><font face=3D"Calibri"><span>Thanks,=
<u></u><u></u></span></font></p>
                <p class=3D"MsoNormal"><font face=3D"Calibri"><span>Mihai<u=
></u><u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt"><u></u>=
=A0<u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">Cheers,<u=
></u><u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt"><u></u>=
=A0<u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">Bruce<u><=
/u><u></u></span></font></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font fac=
e=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">=A0<u></u=
><u></u></span></font></p>
              </div>
              <blockquote style=3D"border:none;border-left:solid #cccccc 1.=
0pt;padding:0in 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
                <div>
                  <div>
                    <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font=
 color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-size:11.0pt;font-fa=
mily:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">=A0</span></=
font><u></u><u></u></p>

                    <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font=
 color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-size:11.0pt;font-fa=
mily:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">Thanks,</spa=
n></font><u></u><u></u></p>

                    <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font=
 color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-size:11.0pt;font-fa=
mily:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">Mihai</span>=
</font><u></u><u></u></p>

                    <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font=
 color=3D"#1f497d" face=3D"Calibri"><span style=3D"font-size:11.0pt;font-fa=
mily:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">=A0</span></=
font><u></u><u></u></p>

                    <div style=3D"border:none;border-left:solid blue 1.5pt;=
padding:0in 0in 0in 4.0pt">
                      <div>
                        <div style=3D"border:none;border-top:solid #b5c4df =
1.0pt;padding:3.0pt 0in 0in 0in">
                          <p class=3D"MsoNormal" style=3D"margin-left:.5in"=
><b><font face=3D"Tahoma"><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;;font-weight:bold">From:</span></font><=
/b><font face=3D"Tahoma"><span style=3D"font-size:10.0pt;font-family:&quot;=
Tahoma&quot;,&quot;sans-serif&quot;"><a href=3D"mailto:meta-virtualization-=
bounces@yoctoproject.org" target=3D"_blank">meta-virtualization-bounces@yoc=
toproject.org</a>
                                [mailto:<a href=3D"mailto:meta-virtualizati=
on-bounces@yoctoproject.org" target=3D"_blank">meta-virtualization-bounces@=
yoctoproject.org</a>]
                                <b><span style=3D"font-weight:bold">On
                                    Behalf Of </span></b>Raymond <span>
                                  Danks</span><br>
                                <b><span style=3D"font-weight:bold">Sent:</=
span></b>
                                Monday, January 07, 2013 8:32 PM<br>
                                <b><span style=3D"font-weight:bold">To:</sp=
an></b>
                                Bruce Ashfield<br>
                                <b><span style=3D"font-weight:bold">Cc:</sp=
an></b>
                                <a href=3D"mailto:meta-virtualization@yocto=
project.org" target=3D"_blank">
                                  meta-virtualization@yoctoproject.org</a><=
br>
                                <b><span style=3D"font-weight:bold">Subject=
:</span></b>
                                Re: [meta-virtualization] [PATCH 1/2]
                                <span>linux-yocto</span>:
                                added kernel configuration for KVM</span></=
font><u></u><u></u></p>
                        </div>
                      </div>
                      <div>
                        <div>
                          <p class=3D"MsoNormal" style=3D"margin-left:.5in"=
><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt"=
>=A0<u></u><u></u></span></font></p>
                          <div>
                            <p class=3D"MsoNormal" style=3D"margin-left:.5i=
n"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0p=
t">On 01/07/2013
                                  11:10 AM, Bruce Ashfield wrote:<u></u><u>=
</u></span></font></p>
                          </div>
                          <blockquote style=3D"margin-top:5.0pt;margin-bott=
om:5.0pt">
                            <div>
                              <p class=3D"MsoNormal" style=3D"margin-left:.=
5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.=
0pt">=A0<u></u><u></u></span></font></p>
                              <div>
                                <p class=3D"MsoNormal" style=3D"margin-bott=
om:12.0pt;margin-left:.5in">
                                  <font face=3D"Times New Roman" size=3D"3"=
><span style=3D"font-size:12.0pt">=A0<u></u><u></u></span></font></p>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">On Mon,
                                        Jan 7, 2013 at 12:26 PM, Raymond
                                        <span>Danks</span>
                                        &lt;<a href=3D"mailto:ray.danks@se-=
eng.com" target=3D"_blank">ray.danks@se-eng.com</a>&gt;
                                        wrote:<u></u><u></u></span></font><=
/p>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">I&#39;m
                                        going to show my lack of
                                        knowledge in this area, but I
                                        know this is going to come up
                                        when I push a
                                        <span>xen.cfg</span>
                                        that I apparently never added.<br>
                                        <br>
                                        Is it possible to do something
                                        along the lines of
                                        PACKAGE_CONFIG in the <span>
                                          linux-yocto.bbappend</span>?
                                        =A0For example, in the <span>libvir=
t</span>
                                        package one can use
                                        PACKAGE_CONFIG to construct a
                                        &quot;minimal&quot; build of
                                        <span>libvirt</span>.
                                        =A0What would be the method for
                                        one to do the same in this
                                        package?<u></u><u></u></span></font=
></p>
                                  <div>
                                    <p class=3D"MsoNormal" style=3D"margin-=
left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-si=
ze:12.0pt">=A0<u></u><u></u></span></font></p>
                                  </div>
                                  <div>
                                    <p class=3D"MsoNormal" style=3D"margin-=
left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-si=
ze:12.0pt">kernel
                                          configuration fragment use are
                                          controlled via the
                                          KERNEL_FEATURES variable, and<u><=
/u><u></u></span></font></p>
                                  </div>
                                  <div>
                                    <p class=3D"MsoNormal" style=3D"margin-=
left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-si=
ze:12.0pt">for
                                          anything pre-<span>yocto</span>
                                          1.4 that means an in-tree
                                          kernel configuration fragment
                                          (I&#39;m still pushing<u></u><u><=
/u></span></font></p>
                                  </div>
                                  <div>
                                    <p class=3D"MsoNormal" style=3D"margin-=
left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-si=
ze:12.0pt">for
                                          the fragments to be maintained
                                          in tree, since that allows
                                          them to be reused and
                                          maintained<u></u><u></u></span></=
font></p>
                                  </div>
                                  <div>
                                    <p class=3D"MsoNormal" style=3D"margin-=
left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-si=
ze:12.0pt">more
                                          easily).<u></u><u></u></span></fo=
nt></p>
                                  </div>
                                  <div>
                                    <p class=3D"MsoNormal" style=3D"margin-=
left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-si=
ze:12.0pt">=A0<u></u><u></u></span></font></p>
                                  </div>
                                  <div>
                                    <p class=3D"MsoNormal" style=3D"margin-=
left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-si=
ze:12.0pt">KERNEL_FEATURES
                                          is managed like any other
                                          variable in the system,
                                          including updating<u></u><u></u><=
/span></font></p>
                                  </div>
                                  <div>
                                    <p class=3D"MsoNormal" style=3D"margin-=
left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-si=
ze:12.0pt">it
                                          via optional/dynamic features
                                          as we see fit.<u></u><u></u></spa=
n></font></p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </blockquote>
                          <p class=3D"MsoNormal" style=3D"margin-bottom:12.=
0pt;margin-left:.5in">
                            <font face=3D"Times New Roman" size=3D"3"><span=
 style=3D"font-size:12.0pt"><br>
                                Thanks Bruce.=A0 Yes, KERNEL_FEATURES is
                                what I was looking for, I believe.=A0 I&#39=
;m
                                seeing some references and examples for
                                this now.<br>
                                <br>
                                Ray<br>
                                <br>
                                <u></u><u></u></span></font></p>
                          <div>
                            <div>
                              <div>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">=A0<u></u><u></u></span></font></p>
                                </div>
                                <blockquote style=3D"border:none;border-lef=
t:solid #cccccc 1.0pt;padding:0in 0in 0in 6.0pt;margin-left:4.8pt;margin-to=
p:5.0pt;margin-right:0in;margin-bottom:5.0pt">
                                  <p class=3D"MsoNormal" style=3D"margin-bo=
ttom:12.0pt;margin-left:.5in">
                                    <font face=3D"Times New Roman" size=3D"=
3"><span style=3D"font-size:12.0pt"><br>
                                        Yes, I imagine that worst case
                                        there can be a <span>SRC_URI_distro=
</span>
                                        definition that includes only
                                        the .<span>scc</span>
                                        files required for that
                                        &quot;minimal&quot; image build, bu=
t it
                                        seems like we want to keep away
                                        from that as much as possible
                                        being that this isn&#39;t a <span>d=
istro</span>
                                        layer.<u></u><u></u></span></font><=
/p>
                                </blockquote>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">=A0<u></u><u></u></span></font></p>
                                </div>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">Typically
                                        we do this via a base
                                        KERNEL_FEATURES specification in
                                        the relevant recipe(s), and<u></u><=
u></u></span></font></p>
                                </div>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><span><font face=3D"Times
                                        New Roman" size=3D"3"><span style=
=3D"font-size:12.0pt">distros</span></font></span>,
                                    or other configurations can
                                    override/extend it as required.<u></u><=
u></u></p>
                                </div>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">=A0<u></u><u></u></span></font></p>
                                </div>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">Cheers,<u></u><u></u></span></font></p>
                                </div>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">=A0<u></u><u></u></span></font></p>
                                </div>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><span><font face=3D"Times
                                        New Roman" size=3D"3"><span style=
=3D"font-size:12.0pt">Buce</span></font></span><u></u><u></u></p>
                                </div>
                                <div>
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">=A0<u></u><u></u></span></font></p>
                                </div>
                                <blockquote style=3D"border:none;border-lef=
t:solid #cccccc 1.0pt;padding:0in 0in 0in 6.0pt;margin-left:4.8pt;margin-to=
p:5.0pt;margin-right:0in;margin-bottom:5.0pt">
                                  <p class=3D"MsoNormal" style=3D"margin-le=
ft:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size=
:12.0pt">Thanks,<br>
                                        Ray <u></u><u></u></span></font></p=
>
                                  <div>
                                    <div>
                                      <p class=3D"MsoNormal" style=3D"margi=
n-left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-=
size:12.0pt"><br>
                                            <br>
                                            On 01/07/2013 05:08 AM,
                                            Mihai Prica wrote:<u></u><u></u=
></span></font></p>
                                      <p class=3D"MsoNormal" style=3D"margi=
n-left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-=
size:12.0pt">Signed-off-by:
                                            Mihai Prica &lt;<a href=3D"mail=
to:mihai.prica@intel.com" target=3D"_blank">mihai.prica@intel.com</a>&gt;<b=
r>
                                            ---<br>
                                            =A0 recipes-kernel/<span>linux<=
/span>/<span>linux-yocto</span>/<span>kvm-enable.scc</span>
                                            | =A0 =A04 ++++<br>
                                            =A0 recipes-kernel/<span>linux<=
/span>/<span>linux-yocto</span>/<span>kvm.cfg</span>
                                            =A0 =A0 =A0 =A0| =A0 =A04 ++++<=
br>
                                            =A0 recipes-kernel/<span>linux<=
/span>/linux-yocto_3.4.bbappend
                                            =A0 | =A0 =A01 +<br>
                                            =A0 3 files changed, 9
                                            insertions(+)<br>
                                            =A0 create mode 100644
                                            recipes-kernel/<span>linux</spa=
n>/<span>linux-yocto</span>/<span>kvm-enable.scc</span><br>
                                            =A0 create mode 100644
                                            recipes-kernel/<span>linux</spa=
n>/<span>linux-yocto</span>/<span>kvm.cfg</span><br>
                                            <br>
                                            diff --<span>git</span>
                                            a/recipes-kernel/<span>linux</s=
pan>/<span>linux-yocto</span>/<span>kvm-enable.scc</span>
                                            b/recipes-kernel/<span>linux</s=
pan>/<span>linux-yocto</span>/<span>kvm-enable.scc</span><br>
                                            new file mode 100644<br>
                                            index 0000000..0b5f4fc<br>
                                            --- /<span>dev</span>/null<br>
                                            +++ b/recipes-kernel/<span>linu=
x</span>/<span>linux-yocto</span>/<span>kvm-enable.scc</span><br>
                                            @@ -0,0 +1,4 @@<br>
                                            +define KFEATURE_DESCRIPTION
                                            &quot;Enable KVM host support&q=
uot;<br>
                                            +define
                                            KFEATURE_COMPATIBILITY board<br=
>
                                            +<br>
                                            +<span>kconf</span>
                                            non-hardware <span>kvm.cfg</spa=
n><br>
                                            diff --<span>git</span>
                                            a/recipes-kernel/<span>linux</s=
pan>/<span>linux-yocto</span>/<span>kvm.cfg</span>
                                            b/recipes-kernel/<span>linux</s=
pan>/<span>linux-yocto</span>/<span>kvm.cfg</span><br>
                                            new file mode 100644<br>
                                            index 0000000..0cfcf58<br>
                                            --- /<span>dev</span>/null<br>
                                            +++ b/recipes-kernel/<span>linu=
x</span>/<span>linux-yocto</span>/<span>kvm.cfg</span><br>
                                            @@ -0,0 +1,4 @@<br>
                                            +CONFIG_KVM=3Dy<br>
                                            +CONFIG_KVM_INTEL=3Dy<br>
                                            +CONFIG_KVM_AMD=3Dy<br>
                                            +CONFIG_TUN=3Dy<br>
                                            diff --<span>git</span>
                                            a/recipes-kernel/<span>linux</s=
pan>/linux-yocto_3.4.bbappend
                                            b/recipes-kernel/<span>linux</s=
pan>/linux-yocto_3.4.bbappend<br>
                                            index 5b163ff..71bead2
                                            100644<br>
                                            --- a/recipes-kernel/<span>linu=
x</span>/linux-yocto_3.4.bbappend<br>
                                            +++ b/recipes-kernel/<span>linu=
x</span>/linux-yocto_3.4.bbappend<br>
                                            @@ -4,5 +4,6 @@ SRC_URI +=3D &q=
uot;<a>file://xt-checksum.scc

                                              \<br>
                                              =A0 =A0 =A0 =A0 =A0 =A0 =A0
                                              file://ebtables.scc \<br>
                                              =A0 =A0 =A0 =A0 =A0 =A0
                                              file://vswitch.scc \<br>
                                              =A0 =A0 =A0 =A0 =A0 =A0 file:=
//lxc.scc
                                              \<br>
                                              + =A0 =A0 =A0 =A0 =A0
                                              =A0file://kvm-enable.scc \<br=
>
                                              =A0 =A0 =A0 =A0 =A0 =A0 </a>&=
quot;<br>
                                            =A0 <u></u><u></u></span></font=
></p>
                                      <p class=3D"MsoNormal" style=3D"margi=
n-left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-=
size:12.0pt">=A0<u></u><u></u></span></font></p>
                                    </div>
                                  </div>
                                  <div>
                                    <div>
                                      <p class=3D"MsoNormal" style=3D"margi=
n-left:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-=
size:12.0pt">_______________________________________________<br>
                                            meta-virtualization mailing
                                            list<br>
                                            <a href=3D"mailto:meta-virtuali=
zation@yoctoproject.org" target=3D"_blank">meta-virtualization@yoctoproject=
.org</a><br>
                                            <a href=3D"https://lists.yoctop=
roject.org/listinfo/meta-virtualization" target=3D"_blank">https://lists.yo=
ctoproject.org/listinfo/meta-virtualization</a><u></u><u></u></span></font>=
</p>

                                    </div>
                                  </div>
                                </blockquote>
                              </div>
                              <p class=3D"MsoNormal" style=3D"margin-left:.=
5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.=
0pt"><br>
                                    <br clear=3D"all">
                                    <u></u><u></u></span></font></p>
                              <div>
                                <p class=3D"MsoNormal" style=3D"margin-left=
:.5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:1=
2.0pt">=A0<u></u><u></u></span></font></p>
                              </div>
                              <p class=3D"MsoNormal" style=3D"margin-left:.=
5in"><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.=
0pt">-- <br>
                                    &quot;Thou shalt not follow the NULL
                                    pointer, for chaos and madness await
                                    thee at its end&quot;
                                    <u></u><u></u></span></font></p>
                            </div>
                          </div>
                          <p class=3D"MsoNormal" style=3D"margin-left:.5in"=
><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt"=
>=A0<u></u><u></u></span></font></p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
            </div>
            <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font face=3D=
"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt"><br>
                  <br clear=3D"all">
                  <u></u><u></u></span></font></p>
            <div>
              <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font face=
=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt"><u></u>=A0=
<u></u></span></font></p>
            </div>
            <p class=3D"MsoNormal" style=3D"margin-left:.5in"><font face=3D=
"Times New Roman" size=3D"3"><span style=3D"font-size:12.0pt">--
                  <br>
                  &quot;Thou shalt not follow the NULL pointer, for chaos a=
nd
                  madness await thee at its end&quot;
                  <u></u><u></u></span></font></p>
          </div>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <br>
      <pre>_______________________________________________
meta-virtualization mailing list
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a>
</pre>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--bcaec54d4de8560f7204d2ef50ff--
