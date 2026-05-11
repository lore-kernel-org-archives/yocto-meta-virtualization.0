Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB87CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 20:16:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59789.1778530595872429255
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 May 2026 13:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a9KQ9sgL;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-90cbb2b50ccso23485985a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 May 2026 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778530595; x=1779135395; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FI3ljgHuxfYPnY9JmgSQRbHX9jZC2LePobixSD9+DzE=;
        b=a9KQ9sgLPQm1jWaqr7rUAez8e5wuBhb6k8LZRZMXTlUmUsGS2DnrJ+vdsZMfgyUKHN
         YL9mrky656i3V1t6UPWXFhxcyzk1L0TkSfK9I4+goxHW8fyc5wkx7w8if2cv8b53A5Ig
         yYs7gsogWVSZSCeWPCeuQpeVZuwq3qpEG3uuosNGNW/dDoc+tFejJhyeppGLb+lWz1C7
         nPzQ33RQzF36+4mdPISyQ5kw9REwL2sz5e4flJbKJCSjWkjwIggWFb5Rj03Kj6XNyZBm
         pL5Sf7j7jUsxXBR1RWUDpqlHQUyP1fCOOYQ03p/kQ5KY8vmrj8G0MTCc2WLTqpLTFDoi
         1gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530595; x=1779135395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FI3ljgHuxfYPnY9JmgSQRbHX9jZC2LePobixSD9+DzE=;
        b=WucNS92/cQouNrTUQKvOIuzER5zMm6W3EjxdcpHQXVu+tFLmXeQldAFgywZslhe0Qy
         94fckcxQhrLVF6ArmmXCxBMuoytbmPB/l6E1s4uwAaEr9b6IUv2T0gnI1hTcJ2YSpO9Q
         ToMxqUWK1HzM6aPuikZq/HRU9fz4EX7LImZ2IME3BqW06AT0p2/t0MLzZg7X3ISmSh2Y
         OFwmRJJ/7GUsysiBM0BNkgpq4fpVmqtE89+BFbG3z+oLGHGFE1tE4+Hf5lsw2zpCZM+p
         YsTtdk2Bpg872U8vU2A/NqSUoDZQZ1M6UOiBhpSKNwBZfUyaE3iz2Bh4JlzXTkZ3sAPx
         mmXQ==
X-Gm-Message-State: AOJu0YywBzO7W/f1FL8SSHLIXFTEIBIwgTBvzf4127caP+4cPheOCUSg
	r0i44latWuoWyY9jyP+FKSpdHm0YJKxslPx4JcQq6wY5hxP2jihqZAME
X-Gm-Gg: Acq92OHVn/N4AEJlNdXinIcZDJheePg9jjs4a3ANw0BSl6bryQ0CjphP2GyWUEhhTCk
	6RdejI2jZ5YGk2nmcKa+pxmP52gQ/EMyn2hN1wY5Lq8P5vH4/LgH/3pQs4vXTY7vtBN8ErC1vNS
	QwVSrK3iZLrvxBZU+LQ60spV5hBk7iEkeMCO/5LtZ451gwwrlTQT90lxamg8fj3XYS7jiFUpdV3
	yaFpoEk7p7jL+PBz5Y+ya4vr3Gk+y6NB7E+aeIGe79FhJURhqMFucRqxO/0cNd2+bBpn7IUAJJb
	MXj94xVE3xXxFPwcWMGrgf/vbLOxWEsKk+ZwF1kfLpF21g3JwKZiHqKxrqA5kErgrR4Smb9sOZL
	ywss88muxB4Ky/QNepB1iZr4+6w9AGN0odM2RYzueVY49IufChbIMwIMRL3/Uxn2kZQjdUbDPqb
	/49cs87YyLAyIYHAHs8H4jjVKG0KKx2HPwd3KPngrVxByOu9v7r6Ry5kZAzQmLo/vr9hDmMu0so
	n8AALAbExZDjGFgBxcca+go42FeW6sYESaz
X-Received: by 2002:ac8:5a04:0:b0:50f:783d:8cb1 with SMTP id d75a77b69052e-514a0cc40a1mr161374291cf.58.1778530594701;
        Mon, 11 May 2026 13:16:34 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e656452sm110649851cf.7.2026.05.11.13.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:16:34 -0700 (PDT)
Date: Mon, 11 May 2026 20:16:32 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: massimiliano.minella@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Massimiliano Minella <massimiliano.minella@se.com>
Subject: Re: [meta-virtualization] [PATCH RESEND] libvirt: fix python3
 compatibility in hook_support.py
Message-ID: <agI5IDPXIsa1YTPf@gmail.com>
References: <20260504-fix_libvirt_hook_script-v1-1-9838f5c96a1a@se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-fix_libvirt_hook_script-v1-1-9838f5c96a1a@se.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 May 2026 20:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9791

Still won't apply via patch:

% git am -s ~/incoming/0003-_meta-virtualization_PATCH_RESEND_libvirt_fix_python3_compatibility_in.patch
Applying: libvirt: fix python3 compatibility in hook_support.py
error: libvirt/libvirt/hook_support.py: does not exist in index
Patch failed at 0001 libvirt: fix python3 compatibility in hook_support.py
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

You are generating the patch using non-standard prefixes. I've fixed it
by using -p0

To fix it on your end, set diff.noprefix=false or omit it, or use
git format-patch without --no-prefix

But no need to resend, this is now applied.

Bruce

In message: [meta-virtualization] [PATCH RESEND] libvirt: fix python3 compatibility in hook_support.py
on 04/05/2026 Massimiliano Minella via lists.yoctoproject.org wrote:

> From: Massimiliano Minella <massimiliano.minella@se.com>
> 
> By default Popen expects all the streams to be bytes-like objects but,
> in the Popen.communicate() function call, the "input" argument is a
> string, making the call fail with the error:
> 
> qemu hook error: a bytes-like object is required, not 'str'
> 
> Fix the error by setting text mode to True in the subprocess creation.
> 
> Also fix the "SyntaxWarning: invalid escape sequence '\w'" in the regex
> used to match script names.
> 
> Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
> ---
>  recipes-extended/libvirt/libvirt/hook_support.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git recipes-extended/libvirt/libvirt/hook_support.py recipes-extended/libvirt/libvirt/hook_support.py
> index 7c5e2a94..63e78b79 100755
> --- recipes-extended/libvirt/libvirt/hook_support.py
> +++ recipes-extended/libvirt/libvirt/hook_support.py
> @@ -35,7 +35,7 @@ def main():
>  			stdin_save = sys.stdin.readlines()
>  		# Match the name name of the hook + a dash + atleast
>  		# one alpha-numeric character.
> -		matcher = re.compile( "%s-\w+" % hook_name )
> +		matcher = re.compile( rf"%s-\w+" % hook_name )
>  		for file_name in sorted( os.listdir( hook_dir ) ):
>  			file_path = os.path.join( hook_dir, file_name )
>  			if matcher.match( file_name ) \
> @@ -43,7 +43,7 @@ def main():
>  			   and os.path.isfile( file_path ) \
>  			   and return_value == 0:
>  				cmd = [ file_path ] + hook_args
> -				p = subprocess.Popen( cmd, stdin=subprocess.PIPE )
> +				p = subprocess.Popen( cmd, stdin=subprocess.PIPE, text=True )
>  				p.communicate( input = ''.join( stdin_save ) )[0]
>  				return_value = p.wait()
>  	except Exception as e:
> 
> ---
> base-commit: 28d26fd95397bf575e65fcca0cbb302b1e9bc7ff
> change-id: 20260107-fix_libvirt_hook_script-c31e952080e9
> 
> Best regards,
> -----BEGIN PGP SIGNATURE-----
> 
> iQIzBAABCgAdFiEEmyckwKYPNcpMkpYoTLqAMKbmymMFAmleiv0ACgkQTLqAMKbm
> ymMqMg//Tf36TeanEuR7dC2FhYcBCxEGl+hoG3OGpD4CJNLmUSN37aqCByV5P0kM
> 2Tc9JKFZr7fXTNTtkmUoiBRm+3+evDliwdQOCRhGK5Ujen2cYP1BTd8hhkHvzb3U
> mswUqFOCEFeCkqt6j/dYc5JtJ//9S22sATEQ6fdUrLLoZRsCRy6we1qXK+Fmpkd0
> 7UdQd4WLKjFTg+mIGQ3MdEGI9TP5+EcLHziKhb6AnLZ0S0ejV3xdjrnNDneV1yMq
> xisdj3Car6N1k39+9aMWYssOUiibKeiQLz0YKJayCfoIk69QtM5bnAx7QNquroAa
> fbC7jFjqnSq4yvtlBjQ5d1MuFGSHlE7RSSd6DSz+wbkte4zAFbKWushuGxS08Hf/
> qYo9aSZv+ifbB1uPfH49/C3MLp7j+its2l8KTGUbHfwe9yN4IWT1F5cYgJEzeOuO
> WjP8G22ym4h/82w+2C0de6eAYCNAL5BuXFaAJfxC74fb2UIn/rh6zGIn6m+EK8sp
> AvclYgU1SHwWNUPzCchdSJP6twIhESHdPbMJLxSpwJVT0IYg5ONod4/lS3JFKpvI
> bjpF18k0b3orSeS61KyEUiXkazDa34I9biml0TC00wW2I/13Z3c36ztamKHmUmmv
> rLEfAunD20nlsbxfXCApgEMwt0OoeiueeI/BKm/9raoYqcmJvdg=
> =pK58
> -----END PGP SIGNATURE-----
> -- 
> Massimiliano Minella <massimiliano.minella@se.com>
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9785): https://lists.yoctoproject.org/g/meta-virtualization/message/9785
> Mute This Topic: https://lists.yoctoproject.org/mt/119139889/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


