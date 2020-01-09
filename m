Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.10063.1578583542976489640
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jan 2020 07:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mvxiYMlv;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id n59so1298618pjb.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Jan 2020 07:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=TdWcbP8hzAtxacKyua+s+Hed+UCvR4xHJ+IOozHiqUk=;
        b=mvxiYMlvzP1WhDr9LXHPPLLDxzxvoi0lYOpdEXlRtdjVZVsNeSq+VI+ZeTbIGEuDIU
         jwLcxnfwoJXnEPKfGG9Zp7DljSCrGlB9MmjfAIHEMZk6JYPC+csAfkpPGl0wZjAUvDpE
         EYihvF/A3OO/Q3pV5+lLsRdxu6gtHM8326zBJ3NIGzvp0nuCPTEFKrfd7MkBk/Xr7w2b
         VepD0axlLkgwgRbjG+K+tVyum3tfMT4wCumsZ85KrIY2ct8iU+eNV3/3wLLbNHUwuq5F
         8r3LW8l4ws2zAR0FedUuIEgvXCm5yB1BrJHnLnx/qLniVgHc9OXjm2uJ90m4/FQXdMLu
         eX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=TdWcbP8hzAtxacKyua+s+Hed+UCvR4xHJ+IOozHiqUk=;
        b=eJ6190/KixQIis84bFo0BmQ5pSwNgFwPtnhWwDj7kV+evBqrkSM//22FmDHObYnhG9
         w0bI/6uK9ssd4w0iaqNgqt26PMnS9UXv7bPxD15n1wKb5wFcv2Nnbp/RwKg9A14Ilp/D
         UF2w0Nuujt7LSlM0kMykB125hWY8KbdTWy+s2VUU1wLKtBq3JFfQMqfTJPAlcXEERQwe
         8cAEHjvD90W9gfcdM30ZSz6GyjsCb+xhj8PKrVgJ/DHKmcCwal1M0uuuRThR4dsV2WEu
         6pGji7387Qd/bdjxGnO36bjM/l62LYk8i8XEEyFhyChwYcpwpqysGp+Tp8fsbQsR7sMz
         KRSw==
X-Gm-Message-State: APjAAAU5XdoEi3v0JZWwToO/JFnMbf8VyesOUO7b/cqNu1w1iyvINowT
	S83tUJDLitGsHGVu8+nV8yc=
X-Google-Smtp-Source: APXvYqxDS3wGSGSMk54D2ESWcnQGq2nUHTI/GnizYWk+JFQrR7xosuHHZm5zhMeOKtwApgnCeCXkIQ==
X-Received: by 2002:a17:902:6b03:: with SMTP id o3mr11884756plk.331.1578583542335;
        Thu, 09 Jan 2020 07:25:42 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a? ([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
        by smtp.gmail.com with ESMTPSA id b17sm8605883pfb.146.2020.01.09.07.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 07:25:41 -0800 (PST)
Subject: Re: [meta-virtualization][zeus][PATCH] docker-ce: update to v19.03.5
To: Stefan Agner <stefan@agner.ch>, meta-virtualization@lists.yoctoproject.org
Cc: Stefan Agner <stefan.agner@toradex.com>
References: <20200109152053.17339-1-stefan@agner.ch>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <b284a9f6-2d39-2ff6-89ac-425cad49349d@gmail.com>
Date: Thu, 9 Jan 2020 07:25:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109152053.17339-1-stefan@agner.ch>
Content-Type: multipart/alternative;
 boundary="------------D32BCBB16BC5891414870454"
Content-Language: en-US

--------------D32BCBB16BC5891414870454
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 1/9/20 7:20 AM, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Bump the git hashes to Docker CE v19.03.5. This requires to get the
> docker daemon binary from a different location as the symlink from
> the latest/ subdirectory has been removed. See also commit deaac5d4b3fa
> ("hack/make.sh remove "latest" symlink") in the docker-ce repository.
Bugfix only update? The helps the maintainer decide if the backport is
viable.

- armin
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 817795f..0d088da 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>  
> -SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
> +SRCREV_docker = "633a0ea838f10e000b7c6d6eed1623e6e988b5bb"
>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>  SRC_URI = "\
>  	git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>  
>  S = "${WORKDIR}/git"
>  
> -DOCKER_VERSION = "19.03.2-ce"
> +DOCKER_VERSION = "19.03.5-ce"
>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>  
>  PACKAGES =+ "${PN}-contrib"
> @@ -99,7 +99,7 @@ do_compile() {
>  do_install() {
>  	mkdir -p ${D}/${bindir}
>  	cp ${S}/src/import/components/cli/build/docker ${D}/${bindir}/docker
> -	cp ${S}/src/import/components/engine/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
> +	cp ${S}/src/import/components/engine/bundles/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
>  	cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
>  
>  	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>
> 


--------------D32BCBB16BC5891414870454
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 1/9/20 7:20 AM, Stefan Agner wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200109152053.17339-1-stefan@agner.ch">
      <pre class="moz-quote-pre" wrap="">From: Stefan Agner <a class="moz-txt-link-rfc2396E" href="mailto:stefan.agner@toradex.com">&lt;stefan.agner@toradex.com&gt;</a>

Bump the git hashes to Docker CE v19.03.5. This requires to get the
docker daemon binary from a different location as the symlink from
the latest/ subdirectory has been removed. See also commit deaac5d4b3fa
("hack/make.sh remove "latest" symlink") in the docker-ce repository.
</pre>
    </blockquote>
    Bugfix only update? The helps the maintainer decide if the backport
    is viable.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
      cite="mid:20200109152053.17339-1-stefan@agner.ch">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Stefan Agner <a class="moz-txt-link-rfc2396E" href="mailto:stefan.agner@toradex.com">&lt;stefan.agner@toradex.com&gt;</a>
---
 recipes-containers/docker/docker-ce_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 817795f..0d088da 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
+SRCREV_docker = "633a0ea838f10e000b7c6d6eed1623e6e988b5bb"
 SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
 SRC_URI = "\
 	git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
@@ -38,7 +38,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "19.03.2-ce"
+DOCKER_VERSION = "19.03.5-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 PACKAGES =+ "${PN}-contrib"
@@ -99,7 +99,7 @@ do_compile() {
 do_install() {
 	mkdir -p ${D}/${bindir}
 	cp ${S}/src/import/components/cli/build/docker ${D}/${bindir}/docker
-	cp ${S}/src/import/components/engine/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
+	cp ${S}/src/import/components/engine/bundles/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
 	cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------D32BCBB16BC5891414870454--
