Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA08EE00348
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 12:47:20 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id m13so5978645lah.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 12:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eUuAoEjwSVPae/6POMtX5Pf4rOPFdTdbhD5r6hcifG8=;
	b=glh0KHzcyGcQT4p+0qyJF4WvammjyPZvicxv4O7nn7TD5p61KCAnjFsEVpFIhY//z9
	0S4nxvBtpd3eYeLAr4GTOxu0nXqB6XrPigNvZlubB2zS9WcJbScatVaEmUOaodzVDlZj
	w+zuMdW4M0Q12OC9opt6EQhWadEoJRKMPQnQ1G//IbvZ5CyhPF7GEamHFcdnbbKWsJsh
	Lf35OON1LXQkDFkVRwl1GeSQ6KwUXR6gGw2l969Ay39oYOsGpphJt5BkvP3MCYPW/PKY
	LLtUTW1W5v2chinr7kefjIn/Owe2gSymLRngXq4wpEZAX1Rs4awHs3QvtEIbUkM6YEUN
	6Rbg==
MIME-Version: 1.0
Received: by 10.112.46.199 with SMTP id x7mr1553327lbm.109.1354826839420; Thu,
	06 Dec 2012 12:47:19 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Thu, 6 Dec 2012 12:47:19 -0800 (PST)
In-Reply-To: <1354813596-8233-13-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
	<1354813596-8233-13-git-send-email-david.nystrom@enea.com>
Date: Thu, 6 Dec 2012 15:47:19 -0500
Message-ID: <CADkTA4OD-Giiu7=utV8_q+NNOfyH-Lyau98_0cywCZU2QvrnBQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: David Nystrom <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv4 12/15] Added kernel configuration for LxC and in kernel OpenvSwitch
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
X-List-Received-Date: Thu, 06 Dec 2012 20:47:21 -0000
Content-Type: multipart/alternative; boundary=bcaec55405687ef0f704d0353442

--bcaec55405687ef0f704d0353442
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 6, 2012 at 12:06 PM, <david.c.nystrom@gmail.com> wrote:

> From: David Nystr=F6m <david.nystrom@enea.com>
>
> ---
>  recipes-kernel/linux/linux-yocto/lxc.cfg      |   22
> ++++++++++++++++++++++
>  recipes-kernel/linux/linux-yocto/lxc.scc      |    4 ++++
>  recipes-kernel/linux/linux-yocto/vswitch.cfg  |    2 ++
>  recipes-kernel/linux/linux-yocto/vswitch.scc  |    4 ++++
>  recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 ++++-
>  5 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc
>  create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.scc
>
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg
> b/recipes-kernel/linux/linux-yocto/lxc.cfg
> new file mode 100644
> index 0000000..f720ca6
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -0,0 +1,22 @@
> +CONFIG_CGROUP_DEVICE=3Dy
> +CONFIG_CPUSETS=3Dy
> +CONFIG_PROC_PID_CPUSET=3Dy
> +CONFIG_RESOURCE_COUNTERS=3Dy
> +CONFIG_CGROUP_MEM_RES_CTLR=3Dy
> +CONFIG_CGROUP_SCHED=3Dy
> +CONFIG_FAIR_GROUP_SCHED=3Dy
> +CONFIG_RT_GROUP_SCHED=3Dy
> +CONFIG_CHECKPOINT_RESTORE=3Dy
> +CONFIG_NAMESPACES=3Dy
> +CONFIG_UTS_NS=3Dy
> +CONFIG_IPC_NS=3Dy
> +CONFIG_USER_NS=3Dy
> +CONFIG_PID_NS=3Dy
> +CONFIG_NET_NS=3Dy
> +CONFIG_SECCOMP=3Dy
> +CONFIG_SECURITY_APPARMOR=3Dy
> +
> +CONFIG_CLS_CGROUP=3Dm
> +CONFIG_BLK_CGROUP=3Dm
> +CONFIG_NETPRIO_CGROUP=3Dm
>

This looks good as a start for a new feature fragment, we also have parts
of these same configs covered here:

http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/=
namespaces/namespaces.cfg
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/=
cgroups/cgroups.cfg

And a few other configuration items in other spots. I like this because it
is standalone and gets you everything you need for the advertised feature,
and I only mention the other items so they won't be a surprise, and in
future
work of yocto 1.4+ we'll have some options to share them, allowing their
reuse without too tight a binding to a particular kernel tree.

Cheers,

Bruce


>  +
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.scc
> b/recipes-kernel/linux/linux-yocto/lxc.scc
> new file mode 100644
> index 0000000..ee51883
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/lxc.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable Features needed by LxC, namespaces,
> cgroups et.c."
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware lxc.cfg
> diff --git a/recipes-kernel/linux/linux-yocto/vswitch.cfg
> b/recipes-kernel/linux/linux-yocto/vswitch.cfg
> new file mode 100644
> index 0000000..fcc0ca6
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/vswitch.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_OPENVSWITCH=3Dm
> +
> diff --git a/recipes-kernel/linux/linux-yocto/vswitch.scc
> b/recipes-kernel/linux/linux-yocto/vswitch.scc
> new file mode 100644
> index 0000000..2790b4f
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/vswitch.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable in kernel OpenvSwitch module"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware vswitch.cfg
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index dc97c1b..5b163ff 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -1,5 +1,8 @@
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>
>  SRC_URI +=3D "file://xt-checksum.scc \
> -            file://ebtables.scc "
> +            file://ebtables.scc \
> +           file://vswitch.scc \
> +           file://lxc.scc \
> +           "
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

--bcaec55405687ef0f704d0353442
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 6, 2012 at 12:06 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:david.c.ny=
strom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt;</span>=
 wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div><div>From: David Nystr=F6m &lt;<a href=3D"mailto:davi=
d.nystrom@enea.com" target=3D"_blank">david.nystrom@enea.com</a>&gt;<br>



<br>
---<br>
=A0recipes-kernel/linux/linux-yocto/lxc.cfg =A0 =A0 =A0| =A0 22 +++++++++++=
+++++++++++<br>
=A0recipes-kernel/linux/linux-yocto/lxc.scc =A0 =A0 =A0| =A0 =A04 ++++<br>
=A0recipes-kernel/linux/linux-yocto/vswitch.cfg =A0| =A0 =A02 ++<br>
=A0recipes-kernel/linux/linux-yocto/vswitch.scc =A0| =A0 =A04 ++++<br>
=A0recipes-kernel/linux/linux-yocto_3.4.bbappend | =A0 =A05 ++++-<br>
=A05 files changed, 36 insertions(+), 1 deletion(-)<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/lxc.cfg<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/lxc.scc<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.cfg<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/vswitch.scc<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linu=
x/linux-yocto/lxc.cfg<br>
new file mode 100644<br>
index 0000000..f720ca6<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg<br>
@@ -0,0 +1,22 @@<br>
+CONFIG_CGROUP_DEVICE=3Dy<br>
+CONFIG_CPUSETS=3Dy<br>
+CONFIG_PROC_PID_CPUSET=3Dy<br>
+CONFIG_RESOURCE_COUNTERS=3Dy<br>
+CONFIG_CGROUP_MEM_RES_CTLR=3Dy<br>
+CONFIG_CGROUP_SCHED=3Dy<br>
+CONFIG_FAIR_GROUP_SCHED=3Dy<br>
+CONFIG_RT_GROUP_SCHED=3Dy<br>
+CONFIG_CHECKPOINT_RESTORE=3Dy<br>
+CONFIG_NAMESPACES=3Dy<br>
+CONFIG_UTS_NS=3Dy<br>
+CONFIG_IPC_NS=3Dy<br>
+CONFIG_USER_NS=3Dy<br>
+CONFIG_PID_NS=3Dy<br>
+CONFIG_NET_NS=3Dy<br>
+CONFIG_SECCOMP=3Dy<br>
+CONFIG_SECURITY_APPARMOR=3Dy<br>
+<br>
+CONFIG_CLS_CGROUP=3Dm<br>
+CONFIG_BLK_CGROUP=3Dm<br>
+CONFIG_NETPRIO_CGROUP=3Dm<br></div></div></blockquote><div><br></div><div>=
This looks good as a start for a new feature fragment, we also have parts</=
div><div>of these same configs covered here:</div><div><br></div><div><a hr=
ef=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/fea=
tures/namespaces/namespaces.cfg" target=3D"_blank">http://git.yoctoproject.=
org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/namespaces/namespaces.cf=
g</a><br>


</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kerne=
l-cache/tree/features/cgroups/cgroups.cfg" target=3D"_blank">http://git.yoc=
toproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/cgroups/cgroup=
s.cfg</a><br>

</div><div><br></div><div>And a few other configuration items in other spot=
s. I like this because it</div><div>is standalone and gets you everything y=
ou need for the advertised feature,=A0</div><div>and I only mention the oth=
er items so they won&#39;t be a surprise, and in future</div>

<div>work of yocto 1.4+ we&#39;ll have some options to share them, allowing=
 their=A0</div><div>reuse without too tight a binding to a=A0particular=A0k=
ernel tree.</div><div><br></div>
<div>Cheers,</div><div><br></div><div>Bruce</div><div>=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:=
1ex">

<div><div>
+<br>
diff --git a/recipes-kernel/linux/linux-yocto/lxc.scc b/recipes-kernel/linu=
x/linux-yocto/lxc.scc<br>
new file mode 100644<br>
index 0000000..ee51883<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-yocto/lxc.scc<br>
@@ -0,0 +1,4 @@<br>
+define KFEATURE_DESCRIPTION &quot;Enable Features needed by LxC, namespace=
s, cgroups et.c.&quot;<br>
+define KFEATURE_COMPATIBILITY board<br>
+<br>
+kconf non-hardware lxc.cfg<br>
diff --git a/recipes-kernel/linux/linux-yocto/vswitch.cfg b/recipes-kernel/=
linux/linux-yocto/vswitch.cfg<br>
new file mode 100644<br>
index 0000000..fcc0ca6<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-yocto/vswitch.cfg<br>
@@ -0,0 +1,2 @@<br>
+CONFIG_OPENVSWITCH=3Dm<br>
+<br>
diff --git a/recipes-kernel/linux/linux-yocto/vswitch.scc b/recipes-kernel/=
linux/linux-yocto/vswitch.scc<br>
new file mode 100644<br>
index 0000000..2790b4f<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-yocto/vswitch.scc<br>
@@ -0,0 +1,4 @@<br>
+define KFEATURE_DESCRIPTION &quot;Enable in kernel OpenvSwitch module&quot=
;<br>
+define KFEATURE_COMPATIBILITY board<br>
+<br>
+kconf non-hardware vswitch.cfg<br>
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend<br>
index dc97c1b..5b163ff 100644<br>
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
@@ -1,5 +1,8 @@<br>
=A0FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
<br>
=A0SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
- =A0 =A0 =A0 =A0 =A0 =A0file://ebtables.scc &quot;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0file://ebtables.scc \<br>
+ =A0 =A0 =A0 =A0 =A0 file://vswitch.scc \<br>
+ =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
+ =A0 =A0 =A0 =A0 =A0 &quot;<br>
<br>
--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div>

--bcaec55405687ef0f704d0353442--
