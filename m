Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40C0CE00AAB; Tue, 19 Jan 2016 05:53:12 -0800 (PST)
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
	*      [209.85.213.53 listed in list.dnswl.org]
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01E87E008F5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 05:53:08 -0800 (PST)
Received: by mail-vk0-f53.google.com with SMTP id n1so193795778vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=q5QVtpeRV2qlY1MXunFvEYJWg/ipH5hfXvSM7kV2bik=;
	b=uwqqEnrwSJqOoXUBRW0JOXJhsyDzKzTEgF5zUlTdwJRROKbqdi28L+7gE9oLeHzHWX
	SJC1hqKDc3TvjJtRi79jEjbORl0RmCl2Pc58JjLAXU61PM/j7PlC1OnvVF2nvWH3f79d
	KDrtNj1RXJMN1iGOXKnNBnmqDfCVzDPPZwXG+4TqwqNbvj44ZJk+bmGZTyX9RFQfyyug
	GZ9ssty4xefUr7UhYOyDb8WedDzMUbatlmolPM9L8nMBw0+rgVBzbIsbNYqIOlPxyJEW
	VBMqWDwlURlHW4+i7GzdzF6XHSxBmluoL8m5wAd2s2cm5m8rZS4LTUcc8zyQspn5hFkn
	/4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=q5QVtpeRV2qlY1MXunFvEYJWg/ipH5hfXvSM7kV2bik=;
	b=WxIba2AzPDdtCcBjkbwpLZR89Is7dlMPzQ+7AsT2eR98Ls2qIB5wfe7WNjpMjkctD4
	ujl+Rv0VsKRjzwTlCkZIxOnEBxD7OrX0o6ehaTKSY2WHKpaS3JxpUl5ZAHpcn+/uVHPa
	PFpnflswqDw5T0I5i4fboqa0avaxb54hpOW6QjCGNbM2YVho4MSyxzn7GbImGD8UZEOq
	FHKAMf2KCko+eqga1n2ELlyl6cDbmRtECiXnKcfr6vsG2Ka7fVc7wdLy+FU1xzM+3AAU
	pTbnIVlxCOtPcFYD0iWDcciuaEiuGISTLP/xGOMSl+MHsV7Lb9NAUXdT6Xt243Nj9L8n
	ogcg==
X-Gm-Message-State: ALoCoQlJWk6IbcaUOa6SENB91eoyHtm8pynQ4fMav8IXRQHVBJdZs/TuXUnIAfpox/IlHPwG+6lwNaR5APMG6ollEneeeeGqUQ==
MIME-Version: 1.0
X-Received: by 10.31.150.215 with SMTP id y206mr20067129vkd.63.1453211587908; 
	Tue, 19 Jan 2016 05:53:07 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 19 Jan 2016 05:53:07 -0800 (PST)
In-Reply-To: <1452893472-14242-1-git-send-email-jason.wessel@windriver.com>
References: <1452893472-14242-1-git-send-email-jason.wessel@windriver.com>
Date: Tue, 19 Jan 2016 08:53:07 -0500
Message-ID: <CADkTA4OneAjCCnE9w0C4KtRKJYsB=qQep2Mu5AsHRSm2zMYKzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] ruby-shadow: Work around cross compile gem problem
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
X-List-Received-Date: Tue, 19 Jan 2016 13:53:12 -0000
Content-Type: multipart/alternative; boundary=001a1140fdd87b196b0529b03043

--001a1140fdd87b196b0529b03043
Content-Type: text/plain; charset=UTF-8

nasty stuff.

Definitely an improvement from what we had before. I've merged this
to master.

Bruce

On Fri, Jan 15, 2016 at 4:31 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> Prior to this commit it is not possible to cross build a ruby gem.  In
> fact even on the x86 system the object files for the native gem are
> generated with the wrong compiler (the host compiler instead of the
> cross compiler).
>
> A better way to fix this in the future would be to use only gems that
> supported cross compile tool called rake.  For now the bbclass can
> modify the extconf.rb just before creating the gem and insert some
> code into the Makefile so as to honor the cross compile environment.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  classes/ruby.bbclass                           |   31
> ++++++++++++++++++++++++
>  recipes-support/ruby-shadow/ruby-shadow_git.bb |    2 +-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
> index 0c842d5..92226f6 100644
> --- a/classes/ruby.bbclass
> +++ b/classes/ruby.bbclass
> @@ -83,10 +83,41 @@ RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
>
>  RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
>
> +ruby_gen_extconf_fix() {
> +       cat<<EOF>append
> +  RbConfig::MAKEFILE_CONFIG['CPPFLAGS'] = ENV['CPPFLAGS'] if
> ENV['CPPFLAGS']
> +  \$CPPFLAGS = ENV['CPPFLAGS'] if ENV['CPPFLAGS']
> +  RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']
> +  RbConfig::MAKEFILE_CONFIG['LD'] = ENV['LD'] if ENV['LD']
> +  RbConfig::MAKEFILE_CONFIG['CFLAGS'] = ENV['CFLAGS'] if ENV['CFLAGS']
> +  RbConfig::MAKEFILE_CONFIG['CXXFLAGS'] = ENV['CXXFLAGS'] if
> ENV['CXXFLAGS']
> +EOF
> +       cat append2>>append
> +       sysroot_ruby=${STAGING_INCDIR}/ruby-${RUBY_GEM_VERSION}
> +       ruby_arch=`ls -1 ${sysroot_ruby} |grep -v ruby |tail -1 2>
> /dev/null`
> +       cat<<EOF>>append
> +  system("perl -p -i -e 's#^topdir.*#topdir = ${sysroot_ruby}#' Makefile")
> +  system("perl -p -i -e 's#^hdrdir.*#hdrdir = ${sysroot_ruby}#' Makefile")
> +  system("perl -p -i -e 's#^arch_hdrdir.*#arch_hdrdir =
> ${sysroot_ruby}/\\\\\$(arch)#' Makefile")
> +  system("perl -p -i -e 's#^arch =.*#arch = ${ruby_arch}#' Makefile")
> +  system("perl -p -i -e 's#^LIBPATH =.*#LIBPATH = -L.#' Makefile")
> +EOF
> +}
> +
>  ruby_do_compile() {
> +       if [ -f extconf.rb -a ! -f extconf.rb.orig ] ; then
> +               grep create_makefile extconf.rb > append2 || (exit 0)
> +               ruby_gen_extconf_fix
> +               cp extconf.rb extconf.rb.orig
> +               # Patch extconf.rb for cross compile
> +               cat append >> extconf.rb
> +       fi
>         for gem in ${RUBY_BUILD_GEMS}; do
>                 ${RUBY_COMPILE_FLAGS} gem build $gem
>         done
> +       if [ -f extconf.rb.orig ] ; then
> +               mv extconf.rb.orig extconf.rb
> +       fi
>  }
>
>
> diff --git a/recipes-support/ruby-shadow/ruby-shadow_git.bb
> b/recipes-support/ruby-shadow/ruby-shadow_git.bb
> index 72be016..75588f3 100644
> --- a/recipes-support/ruby-shadow/ruby-shadow_git.bb
> +++ b/recipes-support/ruby-shadow/ruby-shadow_git.bb
> @@ -20,4 +20,4 @@ RDEPENDS_${PN} += " \
>  "
>
>  RUBY_INSTALL_GEMS = "ruby-shadow-${PV}.gem"
> -FILES_${PN}-dbg +=
> "/usr/lib64/ruby/gems/*/gems/ruby-shadow-${PV}/.debug/shadow.so"
> +FILES_${PN}-dbg +=
> "/usr/lib*/ruby/gems/*/gems/ruby-shadow-${PV}/.debug/shadow.so"
> --
> 1.7.9.5
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

--001a1140fdd87b196b0529b03043
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>nasty stuff.<br><br></div>Definitely an imp=
rovement from what we had before. I&#39;ve merged this<br></div>to master.<=
br><br></div>Bruce<br></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Fri, Jan 15, 2016 at 4:31 PM, Jason Wessel <span dir=3D"ltr">=
&lt;<a href=3D"mailto:jason.wessel@windriver.com" target=3D"_blank">jason.w=
essel@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Prior to this commit it is not possible to cross build a ruby gem.=C2=A0 I=
n<br>
fact even on the x86 system the object files for the native gem are<br>
generated with the wrong compiler (the host compiler instead of the<br>
cross compiler).<br>
<br>
A better way to fix this in the future would be to use only gems that<br>
supported cross compile tool called rake.=C2=A0 For now the bbclass can<br>
modify the extconf.rb just before creating the gem and insert some<br>
code into the Makefile so as to honor the cross compile environment.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0classes/ruby.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A031 ++++++++++=
++++++++++++++<br>
=C2=A0recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ruby-shadow_git.bb</a> |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A02 files changed, 32 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass<br>
index 0c842d5..92226f6 100644<br>
--- a/classes/ruby.bbclass<br>
+++ b/classes/ruby.bbclass<br>
@@ -83,10 +83,41 @@ RUBY_INSTALL_GEMS ?=3D &quot;${BPN}-${BPV}.gem&quot;<br=
>
<br>
=C2=A0RUBY_COMPILE_FLAGS ?=3D &#39;LANG=3D&quot;en_US.UTF-8&quot; LC_ALL=3D=
&quot;en_US.UTF-8&quot;&#39;<br>
<br>
+ruby_gen_extconf_fix() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat&lt;&lt;EOF&gt;append<br>
+=C2=A0 RbConfig::MAKEFILE_CONFIG[&#39;CPPFLAGS&#39;] =3D ENV[&#39;CPPFLAGS=
&#39;] if ENV[&#39;CPPFLAGS&#39;]<br>
+=C2=A0 \$CPPFLAGS =3D ENV[&#39;CPPFLAGS&#39;] if ENV[&#39;CPPFLAGS&#39;]<b=
r>
+=C2=A0 RbConfig::MAKEFILE_CONFIG[&#39;CC&#39;] =3D ENV[&#39;CC&#39;] if EN=
V[&#39;CC&#39;]<br>
+=C2=A0 RbConfig::MAKEFILE_CONFIG[&#39;LD&#39;] =3D ENV[&#39;LD&#39;] if EN=
V[&#39;LD&#39;]<br>
+=C2=A0 RbConfig::MAKEFILE_CONFIG[&#39;CFLAGS&#39;] =3D ENV[&#39;CFLAGS&#39=
;] if ENV[&#39;CFLAGS&#39;]<br>
+=C2=A0 RbConfig::MAKEFILE_CONFIG[&#39;CXXFLAGS&#39;] =3D ENV[&#39;CXXFLAGS=
&#39;] if ENV[&#39;CXXFLAGS&#39;]<br>
+EOF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat append2&gt;&gt;append<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_ruby=3D${STAGING_INCDIR}/ruby-${RUBY_GE=
M_VERSION}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ruby_arch=3D`ls -1 ${sysroot_ruby} |grep -v rub=
y |tail -1 2&gt; /dev/null`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat&lt;&lt;EOF&gt;&gt;append<br>
+=C2=A0 system(&quot;perl -p -i -e &#39;s#^topdir.*#topdir =3D ${sysroot_ru=
by}#&#39; Makefile&quot;)<br>
+=C2=A0 system(&quot;perl -p -i -e &#39;s#^hdrdir.*#hdrdir =3D ${sysroot_ru=
by}#&#39; Makefile&quot;)<br>
+=C2=A0 system(&quot;perl -p -i -e &#39;s#^arch_hdrdir.*#arch_hdrdir =3D ${=
sysroot_ruby}/\\\\\$(arch)#&#39; Makefile&quot;)<br>
+=C2=A0 system(&quot;perl -p -i -e &#39;s#^arch =3D.*#arch =3D ${ruby_arch}=
#&#39; Makefile&quot;)<br>
+=C2=A0 system(&quot;perl -p -i -e &#39;s#^LIBPATH =3D.*#LIBPATH =3D -L.#&#=
39; Makefile&quot;)<br>
+EOF<br>
+}<br>
+<br>
=C2=A0ruby_do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f extconf.rb -a ! -f extconf.rb.orig ] ; =
then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep create_makefil=
e extconf.rb &gt; append2 || (exit 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ruby_gen_extconf_fi=
x<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp extconf.rb extco=
nf.rb.orig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Patch extconf.rb =
for cross compile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat append &gt;&gt;=
 extconf.rb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for gem in ${RUBY_BUILD_GEMS}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${RUBY_COMPILE_FLAG=
S} gem build $gem<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f extconf.rb.orig ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv extconf.rb.orig =
extconf.rb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
<br>
diff --git a/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.=
bb" rel=3D"noreferrer" target=3D"_blank">ruby-shadow_git.bb</a> b/recipes-s=
upport/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">ruby-shadow_git.bb</a><br>
index 72be016..75588f3 100644<br>
--- a/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ruby-shadow_git.bb</a><br>
+++ b/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ruby-shadow_git.bb</a><br>
@@ -20,4 +20,4 @@ RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RUBY_INSTALL_GEMS =3D &quot;ruby-shadow-${PV}.gem&quot;<br>
-FILES_${PN}-dbg +=3D &quot;/usr/lib64/ruby/gems/*/gems/ruby-shadow-${PV}/.=
debug/shadow.so&quot;<br>
+FILES_${PN}-dbg +=3D &quot;/usr/lib*/ruby/gems/*/gems/ruby-shadow-${PV}/.d=
ebug/shadow.so&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div>

--001a1140fdd87b196b0529b03043--
