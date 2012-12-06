Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3363E00348
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 12:49:08 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id m13so5980000lah.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 12:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cLVUL/LB1XB9fPlgKjQkxlNYlIdm2AWwC/qYsWQ8mlE=;
	b=MbaxEfVzMFWoxV9D0S4BtimD7ZqycHjt/flRv4159k+QeLx6S9f0S+R+InJVNklmmH
	zRfb27C0KKxFjIHQ5Z3gQh4Gg/KtSaUQt9jTujRYxYqi3IOWC+YmLr+bV6nwDHW9/Xq4
	kq90HsmA7lwFe1o5gFHf+sayfjvBedycHfeezSjGqhrBcMDBT1rurzYjf2EpIPcNCpze
	C483vFcHDAjgOQd/2VqyNtLcVJd+4ErwBAWyi/unenfwx6Zqn2asbfRMP+p5leX9YwaQ
	cjtiDYftUN3bnf0C1jdguV/yj8cmVV69GPexjgCrX+Vyan7HcI2XOVq560dqLt26M3AT
	Tqnw==
MIME-Version: 1.0
Received: by 10.152.105.33 with SMTP id gj1mr3168917lab.49.1354826947757; Thu,
	06 Dec 2012 12:49:07 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Thu, 6 Dec 2012 12:49:07 -0800 (PST)
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
Date: Thu, 6 Dec 2012 15:49:07 -0500
Message-ID: <CADkTA4MBjGfqctC3Dwi69=O2xk6Xba5eAeNVq8=bvfUD7TqMkA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: David Nystrom <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv4 00/15] meta-cloud merge, updated with review comments
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
X-List-Received-Date: Thu, 06 Dec 2012 20:49:09 -0000
Content-Type: multipart/alternative; boundary=f46d040716e3f406fe04d0353a4f

--f46d040716e3f406fe04d0353a4f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 6, 2012 at 12:06 PM, <david.c.nystrom@gmail.com> wrote:

> From: David Nystr=F6m <david.nystrom@enea.com>
>
> PATCHv4 updated with review comments.
>
> David Nystr=F6m (15):
>   Added protobuf-c criu dependency
>   Added protobuf criu dependency
>   Added CRIU recipe
>   Added netcf recipe, libvirt dependency
>   Added openbsd-netcat recipe, libvirt dependency
>   Added openflow recipe
>   Added openvswitch recipe
>   Added .gitignore file
>   Changed David Nystr=F6ms email in README
>   Added template cloud-* images
>   Added some details in README, and made the description common
>   Added kernel configuration for LxC and in kernel OpenvSwitch
>   Updated libvirt to 1.0.0, added more details to packageconfig
>   Removed old version of libvirt
>   Added LxC recipe from meta-fsl-ppc, curtesy of Matthew McClintock,
>     Stuart Yoder
>

v4 looks pretty good to me, and we can continue to tweak it once it is
in tree.

Reviewed-by: Bruce Ashfield <bruce.ashfield@windriver.com>


>
>  .gitignore                                         |    6 +
>  README                                             |   13 +-
>  recipes-containers/criu/criu_git.bb                |   29 +++
>  .../criu/files/0001-Fixed-hardcoding.patch         |   47 ++++
>  recipes-containers/criu/files/disable_tests.patch  |   19 ++
>  recipes-containers/criu/protobuf-c_0.15.bb         |   20 ++
>  recipes-containers/criu/protobuf_2.4.1.bb          |   18 ++
>  recipes-containers/lxc/files/noldconfig.patch      |   29 +++
>  recipes-containers/lxc/lxc_0.8.0.bb                |   39 +++
>  recipes-extended/images/cloud-image-compute.bb     |   14 +
>  recipes-extended/images/cloud-image-controller.bb  |   34 +++
>  recipes-extended/images/cloud-image-guest.bb       |   18 ++
>  .../{libvirt_0.10.2.bb =3D> libvirt_1.0.0.bb}        |   69 +++--
>  recipes-kernel/linux/linux-yocto/lxc.cfg           |   22 ++
>  recipes-kernel/linux/linux-yocto/lxc.scc           |    4 +
>  recipes-kernel/linux/linux-yocto/vswitch.cfg       |    2 +
>  recipes-kernel/linux/linux-yocto/vswitch.scc       |    4 +
>  recipes-kernel/linux/linux-yocto_3.4.bbappend      |    5 +-
>  recipes-networking/netcat/openbsd-netcat_1.6.bb    |   29 +++
>  recipes-networking/netcf/netcf_git.bb              |   25 ++
>  recipes-networking/openflow/openflow_1.0.bb        |   24 ++
>  .../openvswitch/files/openvswitch-controller       |  274
> ++++++++++++++++++++
>  .../openvswitch/files/openvswitch-controller-setup |   29 +++
>  .../openvswitch/files/openvswitch-example          |  102 ++++++++
>  .../openvswitch/files/openvswitch-switch           |  102 ++++++++
>  .../openvswitch/files/openvswitch-switch-setup     |    8 +
>  .../openvswitch/openvswitch_1.4.3.bb               |   99 +++++++
>  27 files changed, 1053 insertions(+), 31 deletions(-)
>  create mode 100644 .gitignore
>  create mode 100644 recipes-containers/criu/criu_git.bb
>  create mode 100644
> recipes-containers/criu/files/0001-Fixed-hardcoding.patch
>  create mode 100644 recipes-containers/criu/files/disable_tests.patch
>  create mode 100644 recipes-containers/criu/protobuf-c_0.15.bb
>  create mode 100644 recipes-containers/criu/protobuf_2.4.1.bb
>  create mode 100644 recipes-containers/lxc/files/noldconfig.patch
>  create mode 100644 recipes-containers/lxc/lxc_0.8.0.bb
>  create mode 100644 recipes-extended/images/cloud-image-compute.bb
>  create mode 100644 recipes-extended/images/cloud-image-controller.bb
>  create mode 100644 recipes-extended/images/cloud-image-guest.bb
>  rename recipes-extended/libvirt/{libvirt_0.10.2.bb =3D> libvirt_1.0.0.bb=
}
> (61%)
>  create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc
>  create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.scc
>  create mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb
>  create mode 100644 recipes-networking/netcf/netcf_git.bb
>  create mode 100644 recipes-networking/openflow/openflow_1.0.bb
>  create mode 100755
> recipes-networking/openvswitch/files/openvswitch-controller
>  create mode 100644
> recipes-networking/openvswitch/files/openvswitch-controller-setup
>  create mode 100644
> recipes-networking/openvswitch/files/openvswitch-example
>  create mode 100644 recipes-networking/openvswitch/files/openvswitch-swit=
ch
>  create mode 100644
> recipes-networking/openvswitch/files/openvswitch-switch-setup
>  create mode 100644 recipes-networking/openvswitch/openvswitch_1.4.3.bb
>
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d040716e3f406fe04d0353a4f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 6, 2012 at 12:06 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:david.c.ny=
strom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt;</span>=
 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: David Nystr=F6m &lt;<a href=3D"mailto:=
david.nystrom@enea.com">david.nystrom@enea.com</a>&gt;<br>
<br>
PATCHv4 updated with review comments.<br>
<br>
David Nystr=F6m (15):<br>
=A0 Added protobuf-c criu dependency<br>
=A0 Added protobuf criu dependency<br>
=A0 Added CRIU recipe<br>
=A0 Added netcf recipe, libvirt dependency<br>
=A0 Added openbsd-netcat recipe, libvirt dependency<br>
=A0 Added openflow recipe<br>
=A0 Added openvswitch recipe<br>
=A0 Added .gitignore file<br>
=A0 Changed David Nystr=F6ms email in README<br>
=A0 Added template cloud-* images<br>
=A0 Added some details in README, and made the description common<br>
=A0 Added kernel configuration for LxC and in kernel OpenvSwitch<br>
=A0 Updated libvirt to 1.0.0, added more details to packageconfig<br>
=A0 Removed old version of libvirt<br>
=A0 Added LxC recipe from meta-fsl-ppc, curtesy of Matthew McClintock,<br>
=A0 =A0 Stuart Yoder<br></blockquote><div><br></div><div>v4 looks pretty go=
od to me, and we can continue to tweak it once it is</div><div>in tree.</di=
v><div><br></div><div>Reviewed-by: Bruce Ashfield &lt;<a href=3D"mailto:bru=
ce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt;</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
=A0.gitignore =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 | =A0 =A06 +<br>
=A0README =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 | =A0 13 +-<br>
=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" target=3D"_blank"=
>criu_git.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 29 +++<br>
=A0.../criu/files/0001-Fixed-hardcoding.patch =A0 =A0 =A0 =A0 | =A0 47 ++++=
<br>
=A0recipes-containers/criu/files/disable_tests.patch =A0| =A0 19 ++<br>
=A0recipes-containers/criu/<a href=3D"http://protobuf-c_0.15.bb" target=3D"=
_blank">protobuf-c_0.15.bb</a> =A0 =A0 =A0 =A0 | =A0 20 ++<br>
=A0recipes-containers/criu/<a href=3D"http://protobuf_2.4.1.bb" target=3D"_=
blank">protobuf_2.4.1.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 18 ++<br>
=A0recipes-containers/lxc/files/noldconfig.patch =A0 =A0 =A0| =A0 29 +++<br=
>
=A0recipes-containers/lxc/<a href=3D"http://lxc_0.8.0.bb" target=3D"_blank"=
>lxc_0.8.0.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 39 +++<br>
=A0recipes-extended/images/<a href=3D"http://cloud-image-compute.bb" target=
=3D"_blank">cloud-image-compute.bb</a> =A0 =A0 | =A0 14 +<br>
=A0recipes-extended/images/<a href=3D"http://cloud-image-controller.bb" tar=
get=3D"_blank">cloud-image-controller.bb</a> =A0| =A0 34 +++<br>
=A0recipes-extended/images/<a href=3D"http://cloud-image-guest.bb" target=
=3D"_blank">cloud-image-guest.bb</a> =A0 =A0 =A0 | =A0 18 ++<br>
=A0.../{<a href=3D"http://libvirt_0.10.2.bb" target=3D"_blank">libvirt_0.10=
.2.bb</a> =3D&gt; <a href=3D"http://libvirt_1.0.0.bb" target=3D"_blank">lib=
virt_1.0.0.bb</a>} =A0 =A0 =A0 =A0| =A0 69 +++--<br>
=A0recipes-kernel/linux/linux-yocto/lxc.cfg =A0 =A0 =A0 =A0 =A0 | =A0 22 ++=
<br>
=A0recipes-kernel/linux/linux-yocto/lxc.scc =A0 =A0 =A0 =A0 =A0 | =A0 =A04 =
+<br>
=A0recipes-kernel/linux/linux-yocto/vswitch.cfg =A0 =A0 =A0 | =A0 =A02 +<br=
>
=A0recipes-kernel/linux/linux-yocto/vswitch.scc =A0 =A0 =A0 | =A0 =A04 +<br=
>
=A0recipes-kernel/linux/linux-yocto_3.4.bbappend =A0 =A0 =A0| =A0 =A05 +-<b=
r>
=A0recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" targe=
t=3D"_blank">openbsd-netcat_1.6.bb</a> =A0 =A0| =A0 29 +++<br>
=A0recipes-networking/netcf/<a href=3D"http://netcf_git.bb" target=3D"_blan=
k">netcf_git.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 25 ++<br>
=A0recipes-networking/openflow/<a href=3D"http://openflow_1.0.bb" target=3D=
"_blank">openflow_1.0.bb</a> =A0 =A0 =A0 =A0| =A0 24 ++<br>
=A0.../openvswitch/files/openvswitch-controller =A0 =A0 =A0 | =A0274 ++++++=
++++++++++++++<br>
=A0.../openvswitch/files/openvswitch-controller-setup | =A0 29 +++<br>
=A0.../openvswitch/files/openvswitch-example =A0 =A0 =A0 =A0 =A0| =A0102 ++=
++++++<br>
=A0.../openvswitch/files/openvswitch-switch =A0 =A0 =A0 =A0 =A0 | =A0102 ++=
++++++<br>
=A0.../openvswitch/files/openvswitch-switch-setup =A0 =A0 | =A0 =A08 +<br>
=A0.../openvswitch/<a href=3D"http://openvswitch_1.4.3.bb" target=3D"_blank=
">openvswitch_1.4.3.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 99 +++++++<br>
=A027 files changed, 1053 insertions(+), 31 deletions(-)<br>
=A0create mode 100644 .gitignore<br>
=A0create mode 100644 recipes-containers/criu/<a href=3D"http://criu_git.bb=
" target=3D"_blank">criu_git.bb</a><br>
=A0create mode 100644 recipes-containers/criu/files/0001-Fixed-hardcoding.p=
atch<br>
=A0create mode 100644 recipes-containers/criu/files/disable_tests.patch<br>
=A0create mode 100644 recipes-containers/criu/<a href=3D"http://protobuf-c_=
0.15.bb" target=3D"_blank">protobuf-c_0.15.bb</a><br>
=A0create mode 100644 recipes-containers/criu/<a href=3D"http://protobuf_2.=
4.1.bb" target=3D"_blank">protobuf_2.4.1.bb</a><br>
=A0create mode 100644 recipes-containers/lxc/files/noldconfig.patch<br>
=A0create mode 100644 recipes-containers/lxc/<a href=3D"http://lxc_0.8.0.bb=
" target=3D"_blank">lxc_0.8.0.bb</a><br>
=A0create mode 100644 recipes-extended/images/<a href=3D"http://cloud-image=
-compute.bb" target=3D"_blank">cloud-image-compute.bb</a><br>
=A0create mode 100644 recipes-extended/images/<a href=3D"http://cloud-image=
-controller.bb" target=3D"_blank">cloud-image-controller.bb</a><br>
=A0create mode 100644 recipes-extended/images/<a href=3D"http://cloud-image=
-guest.bb" target=3D"_blank">cloud-image-guest.bb</a><br>
=A0rename recipes-extended/libvirt/{<a href=3D"http://libvirt_0.10.2.bb" ta=
rget=3D"_blank">libvirt_0.10.2.bb</a> =3D&gt; <a href=3D"http://libvirt_1.0=
.0.bb" target=3D"_blank">libvirt_1.0.0.bb</a>} (61%)<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.cfg<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.scc<br>
=A0create mode 100644 recipes-networking/netcat/<a href=3D"http://openbsd-n=
etcat_1.6.bb" target=3D"_blank">openbsd-netcat_1.6.bb</a><br>
=A0create mode 100644 recipes-networking/netcf/<a href=3D"http://netcf_git.=
bb" target=3D"_blank">netcf_git.bb</a><br>
=A0create mode 100644 recipes-networking/openflow/<a href=3D"http://openflo=
w_1.0.bb" target=3D"_blank">openflow_1.0.bb</a><br>
=A0create mode 100755 recipes-networking/openvswitch/files/openvswitch-cont=
roller<br>
=A0create mode 100644 recipes-networking/openvswitch/files/openvswitch-cont=
roller-setup<br>
=A0create mode 100644 recipes-networking/openvswitch/files/openvswitch-exam=
ple<br>
=A0create mode 100644 recipes-networking/openvswitch/files/openvswitch-swit=
ch<br>
=A0create mode 100644 recipes-networking/openvswitch/files/openvswitch-swit=
ch-setup<br>
=A0create mode 100644 recipes-networking/openvswitch/<a href=3D"http://open=
vswitch_1.4.3.bb" target=3D"_blank">openvswitch_1.4.3.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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
 thee at its end&quot;<br>
</div>

--f46d040716e3f406fe04d0353a4f--
