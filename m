Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-da0-f53.google.com (mail-da0-f53.google.com
	[209.85.210.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCFA8E00655
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:40:10 -0800 (PST)
Received: by mail-da0-f53.google.com with SMTP id x6so367069dac.26
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=m1oYvxc7FC4fuflamyrE8kUkve6RkGll7zDITCTxszI=;
	b=x0OtYWWMzJJxBL4kfBh6KId5kPcScN7zyLZdu0UZD8N5by59MN++JK/nakgdWzMD7G
	moiIoy6NO0aCi+9hZyRTYvU9ppfn9eHJZyhY+pbX0G4M9HPFiNh9A+hXbxamA9XNkznx
	OhpQqz3c93alLaxddKa6aPhFdfwKQ0viVEXlac5QGzusfcjwdwD6RcboVKVeTeLgUew/
	uh0xJcbFvlNKBrPpa10Z+1eveFLDRMMRl8ObFWnll/2qWW6Mvo4rwlvXd4o0dKAx8Jys
	INrvTBx++L3C+1fwmDkSYxQeMoGpD1ndv7YRnfhLrtGVAIAjZYAxW6jXh8xL2gMXkZEQ
	rOyA==
MIME-Version: 1.0
Received: by 10.66.84.10 with SMTP id u10mr7509779pay.24.1355841610664; Tue,
	18 Dec 2012 06:40:10 -0800 (PST)
Received: by 10.68.1.68 with HTTP; Tue, 18 Dec 2012 06:40:10 -0800 (PST)
In-Reply-To: <1355841118-22361-16-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
	<1355841118-22361-16-git-send-email-david.nystrom@enea.com>
Date: Tue, 18 Dec 2012 09:40:10 -0500
Message-ID: <CADkTA4OYWLAP0X5iowhK35=xtsmptK-xyAuGsBS5K-hp6dq7dQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org, raymond.danks@se-eng.com
Subject: Re: [RFC][PATCH 15/16] Added python-quantumclient recipe
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
X-List-Received-Date: Tue, 18 Dec 2012 14:40:10 -0000
Content-Type: multipart/alternative; boundary=f46d042f96d2934a1104d121799b

--f46d042f96d2934a1104d121799b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m <david.c.nystrom@gmail.com=
>wrote:

> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> ---
>  .../quantumclient/python-quantumclient_git.bb      |   23
> ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 recipes-cloud/quantumclient/
> python-quantumclient_git.bb
>
> diff --git a/recipes-cloud/quantumclient/python-quantumclient_git.bbb/rec=
ipes-cloud/quantumclient/
> python-quantumclient_git.bb
> new file mode 100644
> index 0000000..bb0aae6
> --- /dev/null
> +++ b/recipes-cloud/quantumclient/python-quantumclient_git.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "This is the client API library for Quantum."
> +SECTION =3D "devel/python"
> +LICENSE =3D "Apache-2"
> +PR =3D "0"
> +
> +RDEPENDS_${PN} =3D "python-pyparsing \
> +          python-simplejson \
> +          python-httplib2 \
> +          python-prettytable \
> +          python-cliff \
> +          "
> +
> +SRCREV =3D "bc7ba5e19d4e9039146ca37f77a0b232522cddc8"
> +PV =3D "0.2.1+gitr${SRCREV}"
>

I haven't checked yet (swamped by email at the moment), but is the SRCREV
you have listed the tag/branch for 0.2.1 ?

If it is, we've been using: PV =3D "<version>", since adding the gitr +
SRCREV
doesn't add any value on top of the version number.

(same question/comment applies to the other client python routines).

Cheers,

Bruce




> +SRC_URI =3D "git://
> github.com/openstack/python-quantumclient.git;protocol=3Dhttps"
> +S =3D "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1dece7821bf3fd70fe1309eaa37d5=
2a2"
> +
> +export BUILD_SYS
> +export HOST_SYS
> +
> +inherit setuptools
> \ No newline at end of file
> --
> 1.7.9.5
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d042f96d2934a1104d121799b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, D=
ec 18, 2012 at 9:31 AM, David Nystr=F6m <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:david.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Signed-off-by: David Nystr=F6m &lt;<a href=3D"mailto:david=
.nystrom@enea.com">david.nystrom@enea.com</a>&gt;<br>

---<br>
=A0.../quantumclient/<a href=3D"http://python-quantumclient_git.bb" target=
=3D"_blank">python-quantumclient_git.bb</a> =A0 =A0 =A0| =A0 23 +++++++++++=
+++++++++<br>
=A01 file changed, 23 insertions(+)<br>
=A0create mode 100644 recipes-cloud/quantumclient/<a href=3D"http://python-=
quantumclient_git.bb" target=3D"_blank">python-quantumclient_git.bb</a><br>
<br>
diff --git a/recipes-cloud/quantumclient/<a href=3D"http://python-quantumcl=
ient_git.bb" target=3D"_blank">python-quantumclient_git.bb</a> b/recipes-cl=
oud/quantumclient/<a href=3D"http://python-quantumclient_git.bb" target=3D"=
_blank">python-quantumclient_git.bb</a><br>

new file mode 100644<br>
index 0000000..bb0aae6<br>
--- /dev/null<br>
+++ b/recipes-cloud/quantumclient/<a href=3D"http://python-quantumclient_gi=
t.bb" target=3D"_blank">python-quantumclient_git.bb</a><br>
@@ -0,0 +1,23 @@<br>
+DESCRIPTION =3D &quot;This is the client API library for Quantum.&quot;<br=
>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2&quot;<br>
+PR =3D &quot;0&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;python-pyparsing \<br>
+ =A0 =A0 =A0 =A0 =A0python-simplejson \<br>
+ =A0 =A0 =A0 =A0 =A0python-httplib2 \<br>
+ =A0 =A0 =A0 =A0 =A0python-prettytable \<br>
+ =A0 =A0 =A0 =A0 =A0python-cliff \<br>
+ =A0 =A0 =A0 =A0 =A0&quot;<br>
+<br>
+SRCREV =3D &quot;bc7ba5e19d4e9039146ca37f77a0b232522cddc8&quot;<br>
+PV =3D &quot;0.2.1+gitr${SRCREV}&quot;<br></blockquote><div><br></div><div=
>I haven&#39;t checked yet (swamped by email at the moment), but is the SRC=
REV</div><div>you have listed the tag/branch for 0.2.1 ?=A0</div><div><br>
</div><div>If it is, we&#39;ve been using: PV =3D &quot;&lt;version&gt;&quo=
t;, since adding the gitr + SRCREV=A0</div><div>doesn&#39;t add any value o=
n top of the version number.</div><div><br></div><div>(same question/commen=
t applies to the other client python routines).</div>
<div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div><br></=
div><div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex">

+SRC_URI =3D &quot;git://<a href=3D"http://github.com/openstack/python-quan=
tumclient.git;protocol=3Dhttps" target=3D"_blank">github.com/openstack/pyth=
on-quantumclient.git;protocol=3Dhttps</a>&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1dece7821bf3fd70fe1309eaa3=
7d52a2&quot;<br>
+<br>
+export BUILD_SYS<br>
+export HOST_SYS<br>
+<br>
+inherit setuptools<br>
\ No newline at end of file<br>
<span class=3D""><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;<br>
</div>

--f46d042f96d2934a1104d121799b--
