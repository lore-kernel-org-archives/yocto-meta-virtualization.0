Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99CDCD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:17:04 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59793.1778530616360945696
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 May 2026 13:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dJvmhW8H;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ef45a6d9dfso517459485a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 May 2026 13:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778530615; x=1779135415; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXWAsq8oQBrV3Z1UzmC1F9CDk2Z7dIt/562BmDuU09I=;
        b=dJvmhW8HfGE8ZjmeTlvEke/RGW8A+fObmSVtgqOuSkuTiL5ThVUXf6TuVcOpyDHq4O
         ZQgAvvxTu0fZFfljeooj/if8v4X/zYE20X7EpxbP3My/ZsZ2w6V6BNDKrT83pcK+Wghb
         vOgVDp18zKSEwLX+LYIycVmsb/Qk8jT9XjdRaIZ/ZDGdEZmlZp5l9jt+q/DKqy2raNb8
         7JznppHRf65BTsIsPLKPF9rKHFBSReehHP2g6B7q5Aaltxj7f8HjvsxOum7aZmebftuA
         DdEsVbcO3XGVC6ZSlkFetT9fIunBbwFN3UQiOFP5u37Bt5i+f8U6b9RGxjSbwoQps4IW
         ZAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530615; x=1779135415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXWAsq8oQBrV3Z1UzmC1F9CDk2Z7dIt/562BmDuU09I=;
        b=ctFTY94cn8+K0FW+915m4bzwLsSWkzaIJnklXbt20MSBKhsnbIAgjTj/3tragG8DdS
         f+8f0wPWAj4ap8j9xE8bhKrItSFZvp0kT/8ngCsNutprI9hLdbm3ikH0j8dSGlA4JikO
         jOMoAwBhttBGYxGTs8wE5+6x5H2b8ITpo2uVYmuZxhLTVBrqrWYduhCSRxVI1RMM8ElM
         tsaGgdOZl/S8sfoj4PeP0Y4iFjL7AgiBeemAPRAlxICsiScUWejRGsEickT9XnCpIZcB
         D+Up4NgnaYJDmCZ9xOwKA3pHQxZQmtEwApQ56+y922IowSv3LP8lnxXjIC8xdzbl82La
         PizQ==
X-Gm-Message-State: AOJu0YxSoP8w0aJoqCOGfPIB79Oa+327a2ozANBhpehIMieMiUWtz6/I
	eSYFx+jZnZnr3cOtfkWCS5DmqCRhrJWEPxMTJonXa80Z1S3CAtMMKmcvz6bKJsuPT2MlrQ==
X-Gm-Gg: Acq92OEfOe0f5RLPmZeIX+bo0LzJ+1EFvnWIzXezwhZNu1ghzrEmLNeBWsPkifzMIVa
	gKGPCVqsgvajZGe2XdkOungMUWJc2MTUSaVwZziSebyllZKmdb6vH2aXvKuNsxpQ8TmcfU6zsdS
	eaMCSHTd6tPjOulimx1qWtXC7DzIxvlx1Q4WHgG9mWcOC1ieCLjhk71UGJj8AI0a3t+27IvUnLw
	Hrt0OkPDh1Ex3tiwdxRCvgrMwty0xaPQGSfWU5L2pBusWv33TbPIhyEUloNVwesZdPNpxZy3To2
	b76mUY+U8NDSDoQRV51PgFnGP9xHIO2CJJh35nQeQJLg9WdAiIlEC/yXBcFXFKEEEPoQUuZyNbR
	5nVsDAQgSMUdAZxH3vlYh32JBH63Skcq02ggKjpj4XKOvBtWX/SrWDiUgu4gWYttlVcDA+vaa/q
	gBF9/A9G9zukRasBEE+ifhBuUokUVLpd4qFSJWp/1Hz/dQGJEqNPVEPsRSBUQNZgBDgZ1/gCukU
	UVxlqzmOFpxu8HKhhn+7oWdm7CsXOZwdl/c
X-Received: by 2002:a05:620a:4451:b0:8f0:10b0:9e37 with SMTP id af79cd13be357-904d65e7fefmr3570854985a.41.1778530615082;
        Mon, 11 May 2026 13:16:55 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87bd685sm1157274485a.31.2026.05.11.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:16:54 -0700 (PDT)
Date: Mon, 11 May 2026 20:16:52 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tim.orling@konsulko.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] image-oci: don't preserve ownership
 in directories/files/host layer copies
Message-ID: <agI5NJfzbLMYn7l_@gmail.com>
References: <20260502210140.185898-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502210140.185898-1-tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 May 2026 20:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9792

merged.

Bruce

In message: [meta-virtualization][PATCH] image-oci: don't preserve ownership in directories/files/host layer copies
on 02/05/2026 Tim Orling via lists.yoctoproject.org wrote:

> From: Tim Orling <tim.orling@konsulko.com>
> 
> The multi-layer 'directories', 'files', and 'host' branches in IMAGE_CMD:oci
> copy delta content into the OCI bundle rootfs with 'cp -a'. 'cp -a' implies
> '--preserve=all', which calls lchown() on the destination to copy ownership
> from the source. When a directories/files layer copies a symbolic link whose
> target does not exist at build time (for example, the '/dev/stdout' and
> '/dev/stderr' log forwarding symlinks used by the official nginx Docker
> image), lchown() can return EINVAL under pseudo and 'cp' aborts with:
> 
>     cp: failed to preserve ownership for .../var/log/nginx/access.log: Invalid argument
> 
> failing the whole do_image_oci task.
> 
> The single-layer rootfs copy already handles this correctly:
> 
>     cp -r -a --no-preserve=ownership ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
> 
> and the multi-layer 'packages' branch uses 'rsync -a --no-owner --no-group'
> for the same reason. Bring the three remaining cp -a sites in line by adding
> '--no-preserve=ownership'. Ownership inside an OCI image is set by umoci
> based on the image config and source ownership has no meaning for symlinks
> to runtime device nodes anyway, so dropping preservation is the correct
> behaviour.
> 
> Reproduce: declare a directories: layer that copies a path containing a
> symlink to '/dev/stdout' or '/dev/stderr' (e.g. a postprocess that creates
> /var/log/nginx/{access,error}.log -> /dev/{stdout,stderr} to mirror the
> upstream nginx Docker image).
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  classes/image-oci-umoci.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index bad6c5d0..a033d73a 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -611,7 +611,7 @@ IMAGE_CMD:oci() {
>                              oci_dst_file="$image_bundle_name/rootfs$oci_rel_path"
>                              if [ ! -e "$oci_dst_file" ]; then
>                                  mkdir -p "$(dirname "$oci_dst_file")"
> -                                cp -a "$oci_src_file" "$oci_dst_file"
> +                                cp -a --no-preserve=ownership "$oci_src_file" "$oci_dst_file"
>                                  oci_delta_copied=$(expr $oci_delta_copied + 1)
>                              else
>                                  oci_delta_skipped=$(expr $oci_delta_skipped + 1)
> @@ -638,7 +638,7 @@ IMAGE_CMD:oci() {
>                          oci_dst_file="$image_bundle_name/rootfs$oci_file"
>                          if [ ! -e "$oci_dst_file" ]; then
>                              mkdir -p "$(dirname "$oci_dst_file")"
> -                            cp -a "${IMAGE_ROOTFS}$oci_file" "$oci_dst_file"
> +                            cp -a --no-preserve=ownership "${IMAGE_ROOTFS}$oci_file" "$oci_dst_file"
>                              bbnote "OCI: Added file $oci_file"
>                          else
>                              bbnote "OCI: Skipped file $oci_file (already in bundle)"
> @@ -657,7 +657,7 @@ IMAGE_CMD:oci() {
>                      oci_host_dst="${oci_host_pair##*:}"
>                      if [ -e "$oci_host_src" ]; then
>                          mkdir -p "$image_bundle_name/rootfs$(dirname $oci_host_dst)"
> -                        cp -a "$oci_host_src" "$image_bundle_name/rootfs$oci_host_dst"
> +                        cp -a --no-preserve=ownership "$oci_host_src" "$image_bundle_name/rootfs$oci_host_dst"
>                          bbnote "OCI: Added from host: $oci_host_src -> $oci_host_dst"
>                      else
>                          bbfatal "OCI: Host path not found: $oci_host_src"
> -- 
> 2.47.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9784): https://lists.yoctoproject.org/g/meta-virtualization/message/9784
> Mute This Topic: https://lists.yoctoproject.org/mt/119120580/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


