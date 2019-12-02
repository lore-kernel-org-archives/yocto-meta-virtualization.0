Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.15.1575259736438979646
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 20:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bb9/pA4I;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id v2so92489qtv.8
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Dec 2019 20:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dB6OlM+74z4H4cc24nGU8afqxfjJ3+3vA+Vh49Ldn9M=;
        b=bb9/pA4I1hGza+TqQypy4K87dgIA3TD0Iya3o1ScETAhaYQjfhB3uGx98xkVUzDgYR
         z/huIXl6y43Tg0mfkzZ0jX5xnjVvXjFRKhT2s9ksSmZcZzau5P/V46j+gr2L5JfiQk1U
         3Txj8aH9kUpZnCYNdRErLXd4dVy2O0lf4H/8lC90PS792pG6cr1X57fbD3k4gw6GEnzc
         pKhlppOM/NYvh4Ou8SDZ96pv5vZnb/RxixAmVJm5g9f4lx1moLiC2pr2pGcyChb5vlur
         vOk+6kojLSUQOK+LNRldu/iDQZsS3le447MAcDfphXM/4x2hMgc+u1SW7K84dRhhq2+I
         EiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dB6OlM+74z4H4cc24nGU8afqxfjJ3+3vA+Vh49Ldn9M=;
        b=fsWwvC+lpHbinBJuxHI6InLjUNdfTBvvkhqGQl/wpqPkG+4JGo2IHFR8wja0aeu4cb
         vc9yPtrDz9jSfLlAA5832A+ykKQOAR57XJ5rxIOC1D3Re+aUGAPRPTFQTJAOW2vX/5YZ
         io7CMgl/P8USjQiJiTAWGDMG8cdwSJ6cJQJyhr0vOeLxe71Xhf8vkeiiknjoMCvIJbkQ
         FxUr8G5FYQUzR1gEH6Q529CC4yB74NaGE3nHzPRnuup23QeFZF6FhDGlW4jEla469vbf
         i8msONWA0QUp/Dkpo0vhPwmlSZQQUxgDeaIThVsyWdkfAm+KnqR2u2Xi2s7tvgNkbH2N
         D+5Q==
X-Gm-Message-State: APjAAAXW55WMBj8JN5PnV7gBY4uj/l+rvRP6Ic0oY4NmnkzeVU7JVYFS
	T5U7VA015og/QFlkfWax180=
X-Google-Smtp-Source: APXvYqyKGcE8qvnXZR68TS/THcDbS8R/7Ur487m3gYdxP1gQiiWSLbc45H9HCXr4aRNP4AAiU22PBg==
X-Received: by 2002:ac8:4603:: with SMTP id p3mr51749767qtn.98.1575259735306;
        Sun, 01 Dec 2019 20:08:55 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id 198sm14204836qkn.70.2019.12.01.20.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 20:08:54 -0800 (PST)
Date: Sun, 1 Dec 2019 23:08:53 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] consul: fix compile failure while go upgraded to 1.13
Message-ID: <20191202040852.GB27299@gmail.com>
References: <20191128065127.28275-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191128065127.28275-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] consul: fix compile failure while go upgraded to 1.13
on 27/11/2019 hongxu wrote:

> While go was upgraded to 1.13, there is a do_compile failure,
> Refer upstream envoyproxy to rename imports throughout
> 
> https://github.com/envoyproxy/protoc-gen-validate/pull/161/commits/7428b5f8e7fdabbcc7c9710e23e6f438ba4ff021
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-connectivity/consul/consul_git.bb     |  1 +
>  ...-Migration-Rename-imports-throughout.patch | 82 +++++++++++++++++++
>  2 files changed, 83 insertions(+)
>  create mode 100644 recipes-connectivity/consul/files/0001-Migration-Rename-imports-throughout.patch
> 
> diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
> index 566fbc9c..b96499c4 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/hashicorp/consul/LICENSE;md5=b278a92d2
>  GO_IMPORT = "github.com/hashicorp/consul"
>  SRCREV = "944cc71026c007e7de9467ec3f38f0ad14464fcc"
>  SRC_URI = "git://${GO_IMPORT}.git \
> +           file://0001-Migration-Rename-imports-throughout.patch \
>             file://consul.service \
>            "
>  
> diff --git a/recipes-connectivity/consul/files/0001-Migration-Rename-imports-throughout.patch b/recipes-connectivity/consul/files/0001-Migration-Rename-imports-throughout.patch
> new file mode 100644
> index 00000000..906107da
> --- /dev/null
> +++ b/recipes-connectivity/consul/files/0001-Migration-Rename-imports-throughout.patch
> @@ -0,0 +1,82 @@
> +From a9353f184d6cf6ae7ef1b5676720f5bee0882ec3 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 27 Nov 2019 22:38:25 -0800
> +Subject: [PATCH] Migration: Rename imports throughout
> +
> +rename lyft -> envoyproxy
> +
> +Since upstream envoyproxy update it [https://github.com/envoyproxy/protoc-gen-validate/pull/161/commits/7428b5f8e7fdabbcc7c9710e23e6f438ba4ff021]
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + .../envoy/api/v2/cluster/circuit_breaker.pb.go                | 2 +-
> + .../go-control-plane/envoy/api/v2/route/route.pb.go           | 4 ++--
> + .../envoyproxy/protoc-gen-validate/validate/validate.pb.go    | 2 +-
> + .../envoyproxy/protoc-gen-validate/validate/validate.proto    | 2 +-
> + 4 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/cluster/circuit_breaker.pb.go b/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/cluster/circuit_breaker.pb.go
> +index 30a138eba..7dfcc91e2 100644
> +--- a/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/cluster/circuit_breaker.pb.go
> ++++ b/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/cluster/circuit_breaker.pb.go
> +@@ -87,7 +87,7 @@ type CircuitBreakers_Thresholds struct {
> + 	// The :ref:`RoutingPriority<envoy_api_enum_core.RoutingPriority>`
> + 	// the specified CircuitBreaker settings apply to.
> + 	// [#comment:TODO(htuch): add (validate.rules).enum.defined_only = true once
> +-	// https://github.com/lyft/protoc-gen-validate/issues/42 is resolved.]
> ++	// https://github.com/envoyproxy/protoc-gen-validate/issues/42 is resolved.]
> + 	Priority core.RoutingPriority `protobuf:"varint,1,opt,name=priority,proto3,enum=envoy.api.v2.core.RoutingPriority" json:"priority,omitempty"`
> + 	// The maximum number of connections that Envoy will make to the upstream
> + 	// cluster. If not specified, the default is 1024.
> +diff --git a/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/route/route.pb.go b/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/route/route.pb.go
> +index cce788c7d..ec69f4769 100644
> +--- a/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/route/route.pb.go
> ++++ b/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/route/route.pb.go
> +@@ -1513,7 +1513,7 @@ type RouteAction struct {
> + 	RequestMirrorPolicy *RouteAction_RequestMirrorPolicy `protobuf:"bytes,10,opt,name=request_mirror_policy,json=requestMirrorPolicy,proto3" json:"request_mirror_policy,omitempty"`
> + 	// Optionally specifies the :ref:`routing priority <arch_overview_http_routing_priority>`.
> + 	// [#comment:TODO(htuch): add (validate.rules).enum.defined_only = true once
> +-	// https://github.com/lyft/protoc-gen-validate/issues/42 is resolved.]
> ++	// https://github.com/envoyproxy/protoc-gen-validate/issues/42 is resolved.]
> + 	Priority core.RoutingPriority `protobuf:"varint,11,opt,name=priority,proto3,enum=envoy.api.v2.core.RoutingPriority" json:"priority,omitempty"`
> + 	// Specifies a set of rate limit configurations that could be applied to the
> + 	// route.
> +@@ -3475,7 +3475,7 @@ type VirtualCluster struct {
> + 	// Optionally specifies the HTTP method to match on. For example GET, PUT,
> + 	// etc.
> + 	// [#comment:TODO(htuch): add (validate.rules).enum.defined_only = true once
> +-	// https://github.com/lyft/protoc-gen-validate/issues/42 is resolved.]
> ++	// https://github.com/envoyproxy/protoc-gen-validate/issues/42 is resolved.]
> + 	Method               core.RequestMethod `protobuf:"varint,3,opt,name=method,proto3,enum=envoy.api.v2.core.RequestMethod" json:"method,omitempty"`
> + 	XXX_NoUnkeyedLiteral struct{}           `json:"-"`
> + 	XXX_unrecognized     []byte             `json:"-"`
> +diff --git a/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.pb.go b/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.pb.go
> +index ef5938c83..9a1a4c08d 100644
> +--- a/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.pb.go
> ++++ b/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.pb.go
> +@@ -1,7 +1,7 @@
> + // Code generated by protoc-gen-go. DO NOT EDIT.
> + // source: validate/validate.proto
> + 
> +-package validate // import "github.com/lyft/protoc-gen-validate/validate"
> ++package validate // import "github.com/envoyproxy/protoc-gen-validate/validate"
> + 
> + import proto "github.com/golang/protobuf/proto"
> + import fmt "fmt"
> +diff --git a/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.proto b/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.proto
> +index 1c5e04a16..05cce2cbd 100644
> +--- a/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.proto
> ++++ b/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.proto
> +@@ -1,7 +1,7 @@
> + syntax = "proto2";
> + package validate;
> + 
> +-option go_package = "github.com/lyft/protoc-gen-validate/validate";
> ++option go_package = "github.com/envoyproxy/protoc-gen-validate/validate";
> + option java_package = "com.lyft.pgv.validate";
> + 
> + import "google/protobuf/descriptor.proto";
> +-- 
> +2.21.0
> +
> -- 
> 2.21.0
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4770): https://lists.yoctoproject.org/g/meta-virtualization/message/4770
> Mute This Topic: https://lists.yoctoproject.org/mt/63883590/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-

