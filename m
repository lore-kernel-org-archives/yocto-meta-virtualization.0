Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.4320.1581632606873131600
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 14:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n+zMlcwj;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id z19so7343147qkj.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Feb 2020 14:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h/pO4HZKzz4TDkdu6lilzthq1RBHCDBM2IWXuwBwbqI=;
        b=n+zMlcwjE28AUyph44KYsFckgcISBhxZs9NcbXpqLw7fTwnXkmc92C+gmlyxf861gX
         lA3UtUPjElQpeFs0M+Mls8Wmm1ggHz1a9FcY1pi+NrorkjVV4CCQ1S7oSozQLIKW6d6x
         oFsdqeuS9GtCRCrqWWbRcp/kwgVtMcRgdkSJUU9e38rpNdB34QfN4dmNSxPiVGqZXlUk
         RJ7bI6Is3mySzpj/rd4Vfofis5/lGUNOyr5kNZx1p+Q+mL6o8SHwlCZQMag1rSHILKy6
         L/CN4douVEvz07FQxoOrAgY2/vUrvqeefNrgBbqcQcB/fejCuZbuCYwW7l/3bJKX/Ztf
         Th4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h/pO4HZKzz4TDkdu6lilzthq1RBHCDBM2IWXuwBwbqI=;
        b=TXAgChZrRAwJjHh4s+V4StfCq49Z2tolGaduS7pz8XtiKZH67d5V3QsHTrGHSJAMib
         u+zDDuwtapj3D9Nh1gYr+gXP8TduHK7ZdZMvd3BQON0DCnhsBat8d1LjVW47lQzIWIho
         ATul/esAEmm3oR+hnr2UwLV8Uo1D1nP5K0SzlKGsvc5aNwfvLc9SQB3btBZmwdbXrxsS
         szI9udXqRo6tHefg60Uef4th2Jbq3CRS7hdOhrnFgQlOoND9bPC9cNXTLHOv5zYn9nDW
         qpfc/sGbOLhvfBgOXxqD2EtNkSN5glWgTiYuWb5eWK9n3jA4QJmKgfiKvpzxRobSAxMl
         fg4A==
X-Gm-Message-State: APjAAAU5W4X8jTA8LQl1Ra4Soh/jG9AG1KrHQHkp3e6B+vR1z1Iz6MTp
	+ROVConmFoynxrIBa61pjXI=
X-Google-Smtp-Source: APXvYqxFis2FfpXhZgAj8RydcZRrVv78c9W431LaVaStoRIIhi8Rm/OLJgAvyyWFqMozaIZIwm5w/g==
X-Received: by 2002:a37:30b:: with SMTP id 11mr744688qkd.377.1581632605921;
        Thu, 13 Feb 2020 14:23:25 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id c25sm2063370qkc.12.2020.02.13.14.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 14:23:25 -0800 (PST)
Date: Thu, 13 Feb 2020 17:23:23 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] ceph: 14.2.6 -> 14.2.7
Message-ID: <20200213222322.GB6843@gmail.com>
References: <20200212035346.8364-1-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200212035346.8364-1-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] ceph: 14.2.6 -> 14.2.7
on 12/02/2020 kai wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> Update ceph from 14.2.6 to 14.2.7.
> 
> * Backport patch to fix compile error
> * Replace python with python3 in the script files that /usr/bin/python
>   not exists
> * Replace runtime dependency python3 with python3-core
>   - /usr/bin/python3 is provided by python3-core
>   - packagee python3 is provided by python3-modules which in RDEPENDS already
> 
> This has been build-only tested.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...t-handle_connection-takes-io_context.patch | 67 +++++++++++++++++++
>  .../ceph/{ceph_14.2.6.bb => ceph_14.2.7.bb}   | 39 +++++------
>  2 files changed, 87 insertions(+), 19 deletions(-)
>  create mode 100644 recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
>  rename recipes-extended/ceph/{ceph_14.2.6.bb => ceph_14.2.7.bb} (84%)
> 
> diff --git a/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch b/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
> new file mode 100644
> index 0000000..d18e00a
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-rgw-beast-handle_connection-takes-io_context.patch
> @@ -0,0 +1,67 @@
> +Backport patch from upstream and update context to fix compile error:
> +
> +| /path/to/tmp-glibc/work/core2-64-wrs-linux/ceph/14.2.6-r0/ceph-14.2.6/src/rgw/rgw_asio_frontend.cc:165:38: error: 'class boost::asio::basic_socket<boost::asio::ip::tcp, boost::asio::executor>' has no member named 'get_io_context'
> +|   165 |       auto y = optional_yield{socket.get_io_context(), yield};
> +|       |                               ~~~~~~~^~~~~~~~~~~~~~
> +
> +Upstream-Status: Backport [https://github.com/ceph/ceph/commit/064f142]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From 064f142746ae97f54865069cdacf5aae2b1b14f6 Mon Sep 17 00:00:00 2001
> +From: Casey Bodley <cbodley@redhat.com>
> +Date: Tue, 23 Apr 2019 15:40:01 -0400
> +Subject: [PATCH] rgw: beast handle_connection() takes io_context
> +
> +as of boost 1.70, the socket no longer has a get_io_context(), so we
> +have to pass it in as an argument
> +
> +Signed-off-by: Casey Bodley <cbodley@redhat.com>
> +---
> + src/rgw/rgw_asio_frontend.cc | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/rgw/rgw_asio_frontend.cc b/src/rgw/rgw_asio_frontend.cc
> +index 0e1e09a..f7c13e1 100644
> +--- a/src/rgw/rgw_asio_frontend.cc
> ++++ b/src/rgw/rgw_asio_frontend.cc
> +@@ -84,7 +84,8 @@ class StreamIO : public rgw::asio::ClientIO {
> + using SharedMutex = ceph::async::SharedMutex<boost::asio::io_context::executor_type>;
> +
> + template <typename Stream>
> +-void handle_connection(RGWProcessEnv& env, Stream& stream,
> ++void handle_connection(boost::asio::io_context& context,
> ++                       RGWProcessEnv& env, Stream& stream,
> +                        parse_buffer& buffer, bool is_ssl,
> +                        SharedMutex& pause_mutex,
> +                        rgw::dmclock::Scheduler *scheduler,
> +@@ -161,7 +162,7 @@ void handle_connection(RGWProcessEnv& env, Stream& stream,
> +                                   rgw::io::add_conlen_controlling(
> +                                     &real_client))));
> +       RGWRestfulIO client(cct, &real_client_io);
> +-      auto y = optional_yield{socket.get_io_context(), yield};
> ++      auto y = optional_yield{context, yield};
> +       process_request(env.store, env.rest, &req, env.uri_prefix,
> +                       *env.auth_registry, &client, env.olog, y, scheduler);
> +     }
> +@@ -605,7 +606,7 @@ void AsioFrontend::accept(Listener& l, boost::system::error_code ec)
> +           return;
> +         }
> +         buffer->consume(bytes);
> +-        handle_connection(env, stream, *buffer, true, pause_mutex,
> ++        handle_connection(context, env, stream, *buffer, true, pause_mutex,
> +                           scheduler.get(), ec, yield);
> +         if (!ec) {
> +           // ssl shutdown (ignoring errors)
> +@@ -623,7 +624,7 @@ void AsioFrontend::accept(Listener& l, boost::system::error_code ec)
> +         auto c = connections.add(conn);
> +         auto buffer = std::make_unique<parse_buffer>();
> +         boost::system::error_code ec;
> +-        handle_connection(env, s, *buffer, false, pause_mutex,
> ++        handle_connection(context, env, s, *buffer, false, pause_mutex,
> +                           scheduler.get(), ec, yield);
> +         s.shutdown(tcp::socket::shutdown_both, ec);
> +       });
> +--
> +2.20.1
> +
> diff --git a/recipes-extended/ceph/ceph_14.2.6.bb b/recipes-extended/ceph/ceph_14.2.7.bb
> similarity index 84%
> rename from recipes-extended/ceph/ceph_14.2.6.bb
> rename to recipes-extended/ceph/ceph_14.2.7.bb
> index c213e1a..18df8b4 100644
> --- a/recipes-extended/ceph/ceph_14.2.6.bb
> +++ b/recipes-extended/ceph/ceph_14.2.7.bb
> @@ -13,10 +13,11 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://ceph.conf \
>             file://0001-rgw-add-executor-type-for-basic_waitable_timers.patch \
>             file://0001-common-rgw-workaround-for-boost-1.72.patch \
> +           file://0001-rgw-beast-handle_connection-takes-io_context.patch \
>  "
>  
> -SRC_URI[md5sum] = "10c22151123ce73b3fe49a6700fe24e0"
> -SRC_URI[sha256sum] = "a1d20f2ba4e2d38a52f40e2e75e2ad136e78fa208b59348d3d45895cc4ca7e62"
> +SRC_URI[md5sum] = "8100ce9820714554e6d4717f6f0aa4da"
> +SRC_URI[sha256sum] = "9606dc80553bd97e138cd80b6bbbc117b6b26c66248e490a4e49fc0d4d853862"
>  
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> @@ -26,22 +27,22 @@ DEPENDS = "boost bzip2 curl expat gperf-native \
>             valgrind xfsprogs zlib \
>  "
>  SYSTEMD_SERVICE_${PN} = " \
> -	ceph-radosgw@.service \
> -	ceph-radosgw.target \
> +        ceph-radosgw@.service \
> +        ceph-radosgw.target \
>          ceph-mon@.service \
> -	ceph-mon.target \
> +        ceph-mon.target \
>          ceph-mds@.service \
> -	ceph-mds.target \
> +        ceph-mds.target \
>          ceph-osd@.service \
> -	ceph-osd.target \
> +        ceph-osd.target \
>          ceph.target \
> -	ceph-rbd-mirror@.service \
> -	ceph-rbd-mirror.target \
> -	ceph-volume@.service \
> -	ceph-mgr@.service \
> -	ceph-mgr.target \
> -	ceph-crash.service \
> -	rbdmap.service \
> +        ceph-rbd-mirror@.service \
> +        ceph-rbd-mirror.target \
> +        ceph-volume@.service \
> +        ceph-mgr@.service \
> +        ceph-mgr.target \
> +        ceph-crash.service \
> +        rbdmap.service \
>  "
>  OECMAKE_GENERATOR = "Unix Makefiles"
>  
> @@ -69,10 +70,10 @@ do_configure_prepend () {
>  }
>  
>  do_install_append () {
> -	sed -i -e 's:${WORKDIR}.*python3:${bindir}/python:' ${D}${bindir}/ceph
> -	sed -i -e 's:${WORKDIR}.*python3:${bindir}/python:' ${D}${bindir}/ceph-crash
> -	sed -i -e 's:${WORKDIR}.*python3:${bindir}/python:' ${D}${bindir}/ceph-volume
> -	sed -i -e 's:${WORKDIR}.*python3:${bindir}/python:' ${D}${bindir}/ceph-volume-systemd
> +	sed -i -e 's:^#!/usr/bin/python$:&3:' \
> +		-e 's:${WORKDIR}.*python3:${bindir}/python3:' \
> +		${D}${bindir}/ceph ${D}${bindir}/ceph-crash \
> +		${D}${bindir}/ceph-volume ${D}${bindir}/ceph-volume-systemd
>  	find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
>  	install -d ${D}${sysconfdir}/ceph
>  	install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
> @@ -118,7 +119,7 @@ FILES_${PN}-python = "\
>                  ${PYTHON_SITEPACKAGES_DIR}/* \
>  "
>  RDEPENDS_${PN} += "\
> -		python3 \
> +		python3-core \
>  		python3-misc \
>  		python3-modules \
>  		python3-prettytable \
> -- 
> 2.17.1
> 

> 

