Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15FF8E009B2; Tue, 10 Jul 2018 06:54:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 612F9E00720
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:54:49 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id u14-v6so18389145lfu.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FsBCRTOppYBMDg8phkFdTZ5kyG+uxQHKLb8wSm7Ic4k=;
	b=tnKukQAGsqxgee2iiUpbf3qYAeJ3CXOZvasYPfrQLxT0YNppv4Ax0OM779cDvG429M
	7lhAEpEVqXXeIU1bt2gAG47ygDW9U/gcUGpimCbd/kwgwpG1ZfPoMQB4vm4mzy/SHsmH
	eODZSPmAzPun1VP1FqW9e7OBx8rEAafbQO7iZStwhSGLjAIH4hD6kF43hD7USUO5sNdi
	FYEka9lLK/M5ctNdpzeyC7fcl7DcD8LlDpJIdA2l1lGeKZDhhZISMBxZujtLC+jGiAw+
	vb5yurrbRD2oX/V4uyAVHEWxedqFdNwdIU1/j3yHgIAYSpL46f4agiXFSIg6c5uH1DZs
	bDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FsBCRTOppYBMDg8phkFdTZ5kyG+uxQHKLb8wSm7Ic4k=;
	b=ZONTpeE+kUC0UCZAYXkLpTd5jdJ6BLP3F73nuQBjUzZp45DGinaDsMgtrSKpjiXDVJ
	AU2ZK1XXQLpjtDdN37SdetluoLf/97455XKOzsmWHeMEb0PQeUF89F0//0sVHBh+BeOf
	iJKQabYwZqsyq4WloNtVPSqfdrhY+TDv+Mtv6HDsb/kT2dfuAJQEsZA4YdtMoQHJGfY7
	ajWlJgm5A+VvyURa9XkwHmneelBoBQeRxio7X2ftB68jq9QHs+OaVK3tm+IkLIaTEdad
	4nOqIuyskIHbEfOMzjI16LCppnlyzU+JOFqmoHd9i2procO6nKaiqDrZU04zjEUyki2F
	vGKg==
X-Gm-Message-State: APt69E1S7MQB6lO0y9DOp1JAfKQFKu6BDqCnf5JLFY6pt/Pjfbz1VT4K
	1JFj4n7peCQkI1WrBjRyXWWrbcojy8dJSFaMfMFQDA==
X-Google-Smtp-Source: AAOMgpfyQS8u37MLXxcB+PtrTF+WCqxWG2NgWC03IABivdwB924DF34edWfbZHkZWrkLGpPLPdQKBBHo3YRq4bjahDk=
X-Received: by 2002:a19:5509:: with SMTP id
	n9-v6mr3174942lfe.133.1531230888426; 
	Tue, 10 Jul 2018 06:54:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 06:54:47
	-0700 (PDT)
In-Reply-To: <1530982957-5021-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1530982957-5021-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jul 2018 09:54:47 -0400
Message-ID: <CADkTA4OfQud2N3SrFVaCCt4GN2=HvqA8e8mTTEfuLkQd8az2EQ@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][master][sumo][rocko][PATCH] tgt: Use return instead of exit to restart tgtd, if tgtd is not running
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
X-List-Received-Date: Tue, 10 Jul 2018 13:54:50 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Sat, Jul 7, 2018 at 1:02 PM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
> If the tgtd daemon is stopped, then '/etc/init.d/tgtd.init restart'
> does not start the new tgtd daemon, as the control comes out from the
> stop function, if it finds tgtd is not running.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  meta-openstack/recipes-support/tgt/files/tgtd.init | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/files/tgtd.init b/meta-openstack/recipes-support/tgt/files/tgtd.init
> index 350fd0c..4b0ce94 100644
> --- a/meta-openstack/recipes-support/tgt/files/tgtd.init
> +++ b/meta-openstack/recipes-support/tgt/files/tgtd.init
> @@ -57,11 +57,11 @@ stop ()
>      RETVAL=$?
>      if [ "$RETVAL" -eq 107 ] ; then
>          if [ "$TASK" != "restart" ] ; then
> -            exit 1
> +            return 1
>          fi
>      elif [ "$RETVAL" -ne 0 ] ; then
>          echo "Some initiators are still connected - could not stop tgtd"
> -        exit 2
> +        return 2
>      fi
>      echo -n
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

