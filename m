Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.5928.1585794644267476945
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 19:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TLgJKG9b;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id k13so2523057qki.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Apr 2020 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OiOvxyP7G4pSqXS4m5HsIgAEz/hl5bb7+vsthFh18xk=;
        b=TLgJKG9bxLOCrowbazsps5v2OmUsswKNoOu0mlDizXgj+jR2lYbJs+pgy2LZanN7Ap
         4JCE5XzbgPhawB7BrpxnZTjs/EIB5qfMR6Zgh1tBUBm/ZBJHXtZpzpNCaoVAT7aEZMV6
         IyRF1GRMvZr0XQeuvDrtbqjChJK1MilL8+AuRmWjy9KxhSNIQbI3XqKTeBmrY86dvnQ+
         kepAn1vdrQ8wQXrHyYwQZJioKuYzdyBz3nTtpGK1rNzTU1MwVq43hrRL3Jpj/BX4PD2F
         CW1R9k+nSw+2T100nijKwJCHf8GGglTANSn26MPOz3AHLPwJ+NMKBHiyqYJvDrEU9fNp
         xP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OiOvxyP7G4pSqXS4m5HsIgAEz/hl5bb7+vsthFh18xk=;
        b=M9Qr9X/50KM77Toyvdkh5anst5bM7xWQ8KnLwWesmILLCAqgMpx4DWraHs5s7xtyaI
         KSifExnVMENAv+NEBl3KHMimG/AenVHqrZcNze6MqEamb6MmrNNrUI+UY+ve/3DMd7Wq
         J3MjF8fOZpfc/x+i51MXHOoUBMFAJBJuTa7KOAg1HQg2yI3mnRJ8ZBbRZUo75d4ZYQjc
         GG559zF0nPmpUeILcsRc8Fz2VeC00dC9cl+dNZ6hrw56s4kln0c/BpaDj+Js58WlqVJh
         hYVhIqy/5bhpwuid10T9t1yiH83lDRMX/huJZZbhUqaBzkhkx0/vbwviTSA6qX165LqS
         nPhg==
X-Gm-Message-State: AGi0Pua12QAf+PVUMYP5WbZlsRdOslHDgX9v67gsSb3OopSfZUrWlZKR
	V+U6voyWUytxLlkZezeqZ7I=
X-Google-Smtp-Source: APiQypLtmbndVSmuVXWhwHybOy/eLpF0EbSAPvF5WKBR7oupj05Db41jf16cWiHC7khc9BsbO0rswg==
X-Received: by 2002:a37:2794:: with SMTP id n142mr1363644qkn.336.1585794643306;
        Wed, 01 Apr 2020 19:30:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id h11sm2734867qtr.38.2020.04.01.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 19:30:43 -0700 (PDT)
Date: Wed, 1 Apr 2020 22:30:40 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: Workaround mips assembler crash on target
Message-ID: <20200402023039.GA41338@gmail.com>
References: <1585639015-39281-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1585639015-39281-1-git-send-email-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][PATCH] libvirt: Workaround mips assembler crash on target
on 31/03/2020 hongxu wrote:

> While enabling multilib on qemumips64, lib32 assembler ends up
> crashing on target sometimes due to branch out of range,
> therefore using -O2 for now
> 
> [snip]
> |../../libvirt-6.1.0/tests/qemuxml2argvtest.c: In function 'mymain':
> |../../libvirt-6.1.0/tests/qemuxml2argvtest.c:608:1: note: variable
> tracking size limit exceeded with '-fvar-tracking-assignments', retrying without
> |  608 | mymain(void)
> |      | ^~~~~~
> |/tmp/ccXJSwZR.s: Assembler messages:
> |/tmp/ccXJSwZR.s:43943: Error: branch out of range
> [snip]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_6.1.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
> index 0ad3d8b..44354a4 100644
> --- a/recipes-extended/libvirt/libvirt_6.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
> @@ -375,6 +375,11 @@ EXTRA_OECONF += " \
>      --with-test-suite \
>      "
>  
> +# gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
> +# crashes on target, so remove -Og and use -O2 as workaround
> +SELECTED_OPTIMIZATION_remove_virtclass-multilib-lib32_mipsarch = "-Og"
> +SELECTED_OPTIMIZATION_append_virtclass-multilib-lib32_mipsarch = " -O2"
> +
>  EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
>  
>  PRIVATE_LIBS_${PN}-ptest_append = "libvirt-admin.so.0"
> -- 
> 2.7.4
> 

> 

