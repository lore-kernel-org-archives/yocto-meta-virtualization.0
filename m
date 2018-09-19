Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A87A4E00A4F; Wed, 19 Sep 2018 01:20:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7107FE0095C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 01:20:29 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id g24-v6so4313004lfb.11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 01:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sc21/Suqd0AjyiLSHpXFoPZxRuoSWmbT0hN90GMEUFE=;
	b=tDoCECQDV0n9aTdKivr+sIyoG4kC66bYbvxKJY30tiyseMDsA0rJz7rce6B6yOZOR0
	nxUxRceVtPuy6VnN7LeT0dnVeFWyuPT72dpAZOgsiCjwL+W9Y3Hr6oH1Qa2Z6dnQ8I8U
	fu/iA/dTh+UUjCJw9mdxmEjWrUlo4McBZKkxKxb0UVK70dhbpxreEWg9J0Pj+CcVD58n
	FQ33nSi6z3ahg8DCtuX+0qHWX+prXvPh21doUKN0nzppGKRO16spl37qpj512fw/Cr+e
	Gt1kwGYFY6KveZP9LEFbrVymEVaTNQJ0A81Egi8DG7XOwAWvDve+etIVuo4pLoF/VbLV
	ssvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sc21/Suqd0AjyiLSHpXFoPZxRuoSWmbT0hN90GMEUFE=;
	b=aC4MjcjIWg6dE9xILYm9d1bi+HQ/ev2u7sbfWMQfz/EsIWFzfqSBGD6HapsAn4t0Pz
	CUfthJVDHjp0+H1/XtFhqvePoBcpz/mw34ZGJ7RM2MhEXFw9LLNIckbo6PTBzpRNqsxw
	koaYai+RA4Sx49T6y52wzyp2e2MdcPAhmENFWFoQvt1INdhOwIeFrr8YFeNoxtAEbhU0
	+aYQ4yBksygTZaWDFzFhc/Owky44qw0VyJ9wXbRRZfKvq2usn7qnWHtziZBPUqhNr3CE
	Uq3yS4NokR2g6xcPGjQ81G/Pq0PPxJjq1j3BH2BNikjx/9WdugatiOINOP/uu+FVYi5e
	sPpw==
X-Gm-Message-State: APzg51BJxheFhQ0GCV2BS4EM2+Ph62ARwmQHbOdHnl4QGlY/EI1xS+uJ
	3LW2NFPTdU4qpYP0yQKDz90PpEfSOZpehjp4k/c=
X-Google-Smtp-Source: ANB0Vda4IKkP6iBcHgAZDLtBZleT9VTkEDE81CnpecMPkaRmEZgEXCjgJjnzfPiaiOXThMu4WxnyKZshM7rcYwPw+HI=
X-Received: by 2002:a19:96:: with SMTP id 144-v6mr4499289lfa.101.1537345228180;
	Wed, 19 Sep 2018 01:20:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 01:20:27
	-0700 (PDT)
In-Reply-To: <A6954388-BBBA-4BD1-88DE-45DB7D49D3CB@gmail.com>
References: <A6954388-BBBA-4BD1-88DE-45DB7D49D3CB@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Sep 2018 04:20:27 -0400
Message-ID: <CADkTA4MJ2rrKduuYsp++GHYoDEHuE=HCPYh0xV-oKfc9xtCs4Q@mail.gmail.com>
To: Phillip Warren <warrenphd@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Adding SSL support to RabbitMQ Server 3.2.4
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
X-List-Received-Date: Wed, 19 Sep 2018 08:20:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 18, 2018 at 10:00 PM, Phillip Warren <warrenphd@gmail.com> wrote:
> Multipost from [yocto] as I just realized [meta-virtualization] is probably
> the proper list for this question.
>
> Hi, rookie here. I'm trying to enable SSL for Management Plugin for RabbitMQ
> Server 3.2.4 on pyro.
>
> Without modifying the build, I simply created /etc/rabbitmq/rabbitmq.config
> with the following entries:
>
> [
>
>   {rabbitmq_management,
>
>   [
>
>     {listener, [{port,     15671},
>
>                 {ip,       "0.0.0.0"},
>
>                 {ssl,      true},
>
>                 {ssl_opts, [{cacertfile, "/etc/rabbitmq/root-ca.pem"},
>
>                             {certfile,   "/etc/rabbitmq/dev.pem"},
>
>                             {keyfile,    "/etc/rabbitmq/dev-np.key"}]}]}
>
>   ]}
>
> ].
>
>
> and placed the cacertfile, certfile, and keyfile at /etc/rabbitmq/
>
>
> RabbitMQ Server fails to start at boot.
> /var/log/rabbitmq/rabbitmq@{hostname}.log shows the following error:
>
>
> =ERROR REPORT==== 17-Sep-2018::20:13:16 ===
> ** Generic server rabbit_web_dispatch_registry terminating
> ** Last message in was {add,rabbit_mgmt,
>                            [{port,15671},
>                             {ip,"0.0.0.0"},
>                             {ssl,true},
>                             {ssl_opts,
>                                 [{cacertfile,"/etc/rabbitmq/root-ca.pem"},
>                                  {certfile,"/etc/rabbitmq/dcx-dev.pem"},
>
> {keyfile,"/etc/rabbitmq/dcx-dev-np.key"}]}],
>                            #Fun<rabbit_web_dispatch.1.73001898>,
>                            #Fun<rabbit_mgmt_app.2.77843060>,
>                            {[],"RabbitMQ Management"}}
> ** When Server state == undefined
> ** Reason for termination ==
> ** {could_not_start_listener,
>        [{port,15671},
>         {ip,"0.0.0.0"},
>         {ssl,true},
>         {ssl_opts,
>             [{cacertfile,"/etc/rabbitmq/root-ca.pem"},
>              {certfile,"/etc/rabbitmq/dcx-dev.pem"},
>              {keyfile,"/etc/rabbitmq/dcx-dev-np.key"}]}],
>        {'EXIT',
>            {{case_clause,{error,{"no such file or
> directory","crypto.app"}}},
>             [{mochiweb,ensure_started,1,
>                  [{file,"mochiweb-wrapper/mochiweb-git/src/mochiweb.erl"},
>                   {line,71}]},
>              {mochiweb_socket_server,prep_ssl,1,
>                  [{file,
>
> "mochiweb-wrapper/mochiweb-git/src/mochiweb_socket_server.erl"},
>                   {line,139}]},
>              {mochiweb_socket_server,start_server,2,
>                  [{file,
>
> "mochiweb-wrapper/mochiweb-git/src/mochiweb_socket_server.erl"},
>                   {line,130}]},
>              {supervisor,do_start_child,2,
>                  [{file,"supervisor.erl"},{line,310}]},
>              {supervisor,handle_start_child,2,
>                  [{file,"supervisor.erl"},{line,681}]},
>
> {supervisor,handle_call,3,[{file,"supervisor.erl"},{line,390}]},
>              {gen_server,handle_msg,5,[{file,"gen_server.erl"},{line,585}]},
>              {proc_lib,init_p_do_apply,3,
>                  [{file,"proc_lib.erl"},{line,239}]}]}}}
>
> After googling around, I'm going down the path of trying to build Erlang
> with SSL support. Please stop me if this isn't the proper approach!
>
> I clearly see in
> meta-cloud-services/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
> a line that says:
>
> EXTRA_OECONF = '--without-ssl'
>
>
> To alter this statement, I wrote an erlang-native_R16B03-1.bbappend in my
> meta-layer and tried the following entries:
>
>
> *****************************************************************************************************
>
> DEPENDS += "ncurses-native openssl"
> EXTRA_OECONF = '--with-ssl=/usr/bin/openssl'
>
> This fails to build with the following error:
>
> configure: error: Invalid path to option --with-ssl=PATH
>
> configure: error: /bin/bash
> 'build/tmp/work/x86_64-linux/erlang-native/R16B03-1-r0/otp_src_R16B03-1/erts/configure'
> failed for erts
>
>
> *****************************************************************************************************
>
>
> DEPENDS += "ncurses-native openssl"
> EXTRA_OECONF = '--with-ssl'
>
>
> Builds successfully but produces the same error as above in
> /var/log/rabbitmq/rabbitmq@{hostname}.log
>
> *****************************************************************************************************
>
>
> DEPENDS += "ncurses-native openssl"
> EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${layout_exec_prefix}"
>
> Builds successfully but produces the same error as above in
> /var/log/rabbitmq/rabbitmq@{hostname}.log
> *****************************************************************************************************
>
> DEPENDS += "ncurses-native openssl"
> EXTRA_OECONF =  "--with-ssl use SSL"
>
> Builds successfully but produces the same error as above in
> /var/log/rabbitmq/rabbitmq@{hostname}.log
> *****************************************************************************************************

I can't say that I've enabled this, or tried it myself. But what you
need to keep in mind is that there seems to be different places you
seem to be getting the error. build time and then runtime.

You shouldn't need to modify the -native erlang recipe for your issue,
since that is what runs on the build process itself, what you
configure there should not creep into the runtime erlang (unless there
is some strange packaging going on .. I haven't looked recently). Or
is it that erlang native is the boostrap for the target erlang and
must have ssl enabled for it to make it into the runtime erlang ?

So my question is, have you tried modifying the target erlang versus
the -native erlang ?

For the build time, have you inspected the rabbitmq build itself to
see if how ssl was detected and built into the module you are looking
to add ?

For the runtime error, what you are configuring in the the build, is
not the location where ssl is going to be found on the target, so that
is why the error is being thrown about it not being found.  The target
erlang may need an RDEPENDS added for ssl to make sure that it is
installed on the target in a location that can be found (there is
already a DEPENDS on ssl in the target erlang, so it may be taken care
of already).

Not much help, but some ideas to look into.

Bruce


>
> Detailed help is greatly appreciated. Seems like I'm missing something
> obvious.
>
> Best Regards,
> Phillip Warren
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

