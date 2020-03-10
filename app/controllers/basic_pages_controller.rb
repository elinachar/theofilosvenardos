class BasicPagesController < ApplicationController
  require 'will_paginate/array'

  def index
    testimonials_en = Testimonial.english_testimonials.order("created_at DESC")
    testimonials_gr = Testimonial.greek_testimonials.order("created_at DESC")
    @testimonials = testimonials_en + testimonials_gr
    @testimonials = @testimonials.paginate(:page => params[:page], :per_page => 1)
    # byebug
    # @testimonials = Testimonial.all.paginate(:page => params[:page], :per_page => 1)#.order("created_at DESC")
  end

  def faq
    @faqs = Faq.all
  end

  def about
  end

  def contact
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @phone, @message).deliver_now
  end
end
