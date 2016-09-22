Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50823E00DCA; Thu, 22 Sep 2016 07:03:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.182 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C98ADE006E9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Sep 2016 07:02:56 -0700 (PDT)
Received: by mail-qk0-f182.google.com with SMTP id t7so76771600qkh.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Sep 2016 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HAgH20qtsWIjfLuCC7w5zYS5MeVIOtmXGAputwyF6+U=;
	b=TDnM0j2EG/TSgnNP5fuP9lCfH1Ltp+OQ1H99RppdVSBE+nsBinXMyWiLOC4OPNkYPH
	pYnfIoiE3KthFcv+YiVmkjnx3VKudhryMgFHw80XfeuC3zSb63srvrdkmsG8qmNnMQLg
	IiFo5Ijxhz7HoX7/GE92B2B+QWbBYM7WUqUNfpGwa3pYD7p/xAs51D8mZJcQMfUP4W6I
	9UdrtNSduS3Di0fBXb6zVyuEfA0ObKWIOS/apkf3ISfDii1H0uIDrczBRPrQCHP7w5KF
	iaMPqHCUUVzfkqaGIL4ej+Sdd27pT8NL7bKNR/XJ0GP4DhTI1C724h8o4NqAVkAzrDdJ
	tFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HAgH20qtsWIjfLuCC7w5zYS5MeVIOtmXGAputwyF6+U=;
	b=eR8B+N3EQcm4p5z1uolMpZHCWfOcK2QeUWmEaCLTnob1qqgS39x0V+ZTGWNwiqqs8D
	s9bWHHO6G6mDrs3A7+w57zbz+cZSpoZwPcMopRyOJb0IKuv9xeLZ7Z209fQT+1Q23bnw
	MwfBNcpm3XGGtvo35mR7rEGlo63vtTfKp3algF759JiuTQ2+E/A91fLjYGzDgpFqq1SZ
	wDmHuSAgJAN00sq5CyJPFZmeyPpqV8wR2t/Jpc3xjDAMAw/BPVqZa4NJQbD6B8Yi15Tr
	Ki+2s5DF3siJmlOw3MzfCA1amp78J5Aq87dDLXjEHZV4l9mDogulIHAUNeQ30J1Foyvp
	DhQg==
X-Gm-Message-State: AA6/9RnzIoduqB+V/zIJTXoe2UigF3NKuzaOKM2dgHJ7+0/z6+QkOBAT2E/EsHAN6sYubrJZVx/CGxbhudNexg==
X-Received: by 10.55.116.7 with SMTP id p7mr2301083qkc.239.1474552975475; Thu,
	22 Sep 2016 07:02:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Thu, 22 Sep 2016 07:02:54 -0700 (PDT)
In-Reply-To: <1474363676-21149-1-git-send-email-adrian.dudau@enea.com>
References: <1474363676-21149-1-git-send-email-adrian.dudau@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Sep 2016 10:02:54 -0400
Message-ID: <CADkTA4POdfJTS2ZyavR5T1CHAgWMtG5DpOhkn-Jc9fic=ZpxPw@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] identity.bbclass: Fix python synthax error
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
X-List-Received-Date: Thu, 22 Sep 2016 14:03:02 -0000
Content-Type: multipart/alternative; boundary=001a1148733a4e4c38053d191eb6

--001a1148733a4e4c38053d191eb6
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 20, 2016 at 5:27 AM, Adrian Dudau <adrian.dudau@enea.com> wrote:

> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  meta-openstack/classes/identity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/classes/identity.bbclass
> b/meta-openstack/classes/identity.bbclass
> index 672f6c4..3601f52 100644
> --- a/meta-openstack/classes/identity.bbclass
> +++ b/meta-openstack/classes/identity.bbclass
> @@ -85,7 +85,7 @@ def sanity_check(d):
>      for pkg in servicecreate_packages.split():
>          # User parameters checking.
>          if not d.getVar('USERCREATE_PARAM_%s' % pkg, True) and not
> d.getVar('SERVICECREATE_PARAM_%s' % pkg, True):
> -            raise bb.build.FuncFailed, "%s SERVICECREATE_PACKAGES
> includes %s, but neither USERCREATE_PARAM_%s nor SERVICECREATE_PARAM_%s is
> set" % (d.getVar('FILE'), pkg, pkg, pkg)
> +            raise bb.build.FuncFailed("%s SERVICECREATE_PACKAGES includes
> %s, but neither USERCREATE_PARAM_%s nor SERVICECREATE_PARAM_%s is set" %
> (d.getVar('FILE'), pkg, pkg, pkg))
>
>  python __anonymous() {
>      sanity_check(d)
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1148733a4e4c38053d191eb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Tue, Sep 20, 2016 at 5:27 AM, A=
drian Dudau <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.dudau@enea.com" =
target=3D"_blank">adrian.dudau@enea.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adri=
an.dudau@enea.com">adrian.dudau@enea.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/classes/<wbr>identity.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/classes/<wbr>identity.bbclass b/meta-openstack/=
classes/<wbr>identity.bbclass<br>
index 672f6c4..3601f52 100644<br>
--- a/meta-openstack/classes/<wbr>identity.bbclass<br>
+++ b/meta-openstack/classes/<wbr>identity.bbclass<br>
@@ -85,7 +85,7 @@ def sanity_check(d):<br>
=C2=A0 =C2=A0 =C2=A0for pkg in servicecreate_packages.split()<wbr>:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# User parameters checking.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not d.getVar(&#39;USERCREATE_PARAM_%s&=
#39; % pkg, True) and not d.getVar(&#39;SERVICECREATE_PARAM_<wbr>%s&#39; % =
pkg, True):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFailed, &quot=
;%s SERVICECREATE_PACKAGES includes %s, but neither USERCREATE_PARAM_%s nor=
 SERVICECREATE_PARAM_%s is set&quot; % (d.getVar(&#39;FILE&#39;), pkg, pkg,=
 pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFailed(&quot;=
%s SERVICECREATE_PACKAGES includes %s, but neither USERCREATE_PARAM_%s nor =
SERVICECREATE_PARAM_%s is set&quot; % (d.getVar(&#39;FILE&#39;), pkg, pkg, =
pkg))<br>
<br>
=C2=A0python __anonymous() {<br>
=C2=A0 =C2=A0 =C2=A0sanity_check(d)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a1148733a4e4c38053d191eb6--
