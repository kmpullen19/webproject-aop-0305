public aspect TraceAspectPullen {
   pointcut classToTrace(): within(ComponentApp) || within(ServiceApp) || within(DataApp);
   pointcut methodToTrace():  classToTrace() &&  execution(String getName());

   before(): methodToTrace() {
      System.out.println("[BGN] " + thisJoinPointStaticPart.getSignature() + ", " +
            thisJoinPointStaticPart.getSourceLocation().getLine());
   }

   after(): methodToTrace() {
      System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
   }
}
