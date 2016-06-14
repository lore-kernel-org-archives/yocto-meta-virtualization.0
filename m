Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D21C4E00B1A; Tue, 14 Jun 2016 08:04:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.66 listed in list.dnswl.org]
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D57FE00AF2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jun 2016 08:03:56 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id e205so25844608oig.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jun 2016 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fOhmYz47EnZD5W2L3adWLCHJQyyxKqABWAgUYVixN/4=;
	b=OPuY2edq7gWDT7lv4ijIAg+0CFAdIlt8NTeIj4HmhRLbV6Q6hZGfa3RUT/IMMCMab8
	iJQZNPsm+vk67gOuoKsKBp+YRPisvP8s+F/zTjfzAkd5GWKGqsnnobgXcU7puMG9aI2N
	QMLoBiDEupMMjlR1ZiCTiI2NXlv+dNzeqGH5YZxrOjsIThpNsPfwfhN1gkKTvy74gEmB
	MPAokEwL6wxCv4KqgkDMf4U/HEHYRlh1DsyQq8+26dO5erErjyPEXBDMk1swkFPcjTdl
	Z9Sc0ypyzDxB1HNY/JG2Pm5pTax0ACZDbYGe95CHOfeyirmtKiNExLqo0eVpcS0LxQmE
	kDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fOhmYz47EnZD5W2L3adWLCHJQyyxKqABWAgUYVixN/4=;
	b=JASVXDQZ6QdgZbeJoLLXnpaoqBNh3WACPhoLBwornAIFTrwVqM3Jo1qe6hpDuTmB/5
	IQRY3WY6u59Dkg1ZBG/H13Py1TJaYU9mNOnPIXgmelP+MYUu4Gd3mbtWYz+njJAlHvrI
	vw6bhQ26V3vKgaB2AeQztU4OKOISVUSxdXiO4VWCfmOqdCIlA5df2JCKongbiCOuOqYG
	6e8QAyMMxhEVoaVV7HZWRRV/+CG4asFUnDI+RhO/wzOHyJ80sej5lrqIkjhAdn81pado
	0S9NHvhPsWZ2NPevBp4gtCsxoqrF+gnbAfyGd2rN8kFRNgYWYAFGmVNPigUzUIHSyO2X
	zo4w==
X-Gm-Message-State: ALyK8tKKcV5+vSERQ62Sf+/+9eftu8G1fQejD47IDjmxXvalI4K9lFbv26H0vNx2HquQfhXmSdboeIHCl+oXEA==
X-Received: by 10.157.46.121 with SMTP id c54mr10050545otd.14.1465916634608;
	Tue, 14 Jun 2016 08:03:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Tue, 14 Jun 2016 08:03:53 -0700 (PDT)
In-Reply-To: <1465802595-11295-1-git-send-email-zhe.he@windriver.com>
References: <1465802595-11295-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Jun 2016 11:03:53 -0400
Message-ID: <CADkTA4P_sfmDA0CH-S2T=r8zCJ0bCc+s8Q+apHJu2ZZ6AU2EUQ@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-cinder: Move tgt config files to avoid confliction
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
X-List-Received-Date: Tue, 14 Jun 2016 15:04:02 -0000
Content-Type: multipart/alternative; boundary=001a1139585646de4c05353e500a

--001a1139585646de4c05353e500a
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 13, 2016 at 3:23 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> We might have the following warning and error since both tgt and python-
> cinder create /etc/tgt/targets.conf. This patch creates conf.d/
> under /etc/tgt/ and puts python-cinder's config file there. tgt's
> config file will include it automatically.
>
> warning: Removing tgt-1.0.63+git0+eca74a72d2-r0.0@corei7_64 due to
> file /etc/tgt/targets.conf conflicting with
> python-cinder-7.0.0+git0+61026d4e4f-r0.0@corei7_64
> error: tgt-dev-1.0.63+git0+eca74a72d2-r0.0 requires tgt =
> 1.0.63+git0+eca74a72d2-r0.0
>


merged.

Bruce


>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-cinder_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
> b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
> index 3b8200e..9620e83 100644
> --- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
> @@ -107,8 +107,8 @@ do_install_append() {
>
>      #Create cinder volume group backing file
>      sed
> 's/%CINDER_LVM_VOLUME_BACKING_FILE_SIZE%/${CINDER_LVM_VOLUME_BACKING_FILE_SIZE}/g'
> -i ${D}/etc/cinder/drivers/lvm_iscsi_setup.sh
> -    mkdir -p ${D}/etc/tgt/
> -    echo "include /etc/cinder/data/volumes/*" > ${D}/etc/tgt/targets.conf
> +    mkdir -p ${D}/etc/tgt/conf.d/
> +    echo "include /etc/cinder/data/volumes/*" >
> ${D}/etc/tgt/conf.d/python-cinder.conf
>
>      # Create Cinder nfs_share config file with default nfs server
>      echo "${CINDER_NFS_VOLUME_SERVERS}" > ${D}/etc/cinder/nfs_shares
> --
> 2.8.1
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1139585646de4c05353e500a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jun 13, 2016 at 3:23 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">From: He Zhe &lt;<a href=3D"ma=
ilto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt;<br>
<br>
We might have the following warning and error since both tgt and python-<br=
>
cinder create /etc/tgt/targets.conf. This patch creates conf.d/<br>
under /etc/tgt/ and puts python-cinder&#39;s config file there. tgt&#39;s<b=
r>
config file will include it automatically.<br>
<br>
warning: Removing tgt-1.0.63+git0+eca74a72d2-r0.0@corei7_64 due to<br>
file /etc/tgt/targets.conf conflicting with<br>
python-cinder-7.0.0+git0+61026d4e4f-r0.0@corei7_64<br>
error: tgt-dev-1.0.63+git0+eca74a72d2-r0.0 requires tgt =3D<br>
1.0.63+git0+eca74a72d2-r0.0<br></blockquote><div><br><br></div><div>merged.=
<br><br></div><div>Bruce<br>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-cinde=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">python-cinder_git.bb</a> | 4=
 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-cinder_git.bb" rel=3D"noreferrer" target=3D"_blank">python-cinder_git.bb<=
/a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-cinde=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">python-cinder_git.bb</a><br>
index 3b8200e..9620e83 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-cinde=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">python-cinder_git.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-cinde=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">python-cinder_git.bb</a><br>
@@ -107,8 +107,8 @@ do_install_append() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0#Create cinder volume group backing file<br>
=C2=A0 =C2=A0 =C2=A0sed &#39;s/%CINDER_LVM_VOLUME_BACKING_FILE_SIZE%/${CIND=
ER_LVM_VOLUME_BACKING_FILE_SIZE}/g&#39; -i ${D}/etc/cinder/drivers/lvm_iscs=
i_setup.sh<br>
-=C2=A0 =C2=A0 mkdir -p ${D}/etc/tgt/<br>
-=C2=A0 =C2=A0 echo &quot;include /etc/cinder/data/volumes/*&quot; &gt; ${D=
}/etc/tgt/targets.conf<br>
+=C2=A0 =C2=A0 mkdir -p ${D}/etc/tgt/conf.d/<br>
+=C2=A0 =C2=A0 echo &quot;include /etc/cinder/data/volumes/*&quot; &gt; ${D=
}/etc/tgt/conf.d/python-cinder.conf<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Create Cinder nfs_share config file with default nfs =
server<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;${CINDER_NFS_VOLUME_SERVERS}&quot; &gt; ${D}=
/etc/cinder/nfs_shares<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a1139585646de4c05353e500a--
